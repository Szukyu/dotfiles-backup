{
  description = "Zenful Darwin System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager}:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages =
          [ 
            pkgs.neovim
            pkgs.tmux
            pkgs.eza
            pkgs.tree
            pkgs.fzf
            pkgs.cmatrix
            pkgs.ripgrep
            pkgs.starship
            pkgs.git
            pkgs.zoxide
            pkgs.tldr
            pkgs.fastfetch
            pkgs.nodejs
          ];

        homebrew = {
          enable = true;
          casks = [
            "zen-browser"
            "font-fira-code"
            "font-caskaydia-cove-nerd-font"
            "wezterm"
            "karabiner-elements"
            "raycast"
          ];
          onActivation.cleanup = "zap";
        };

        users.users.szukyu = {
          name = "szukyu";
          home = "/Users/szukyu";
        };

        system.defaults = {
          dock.autohide = true;
          screencapture.location = "~/Documents/Screenshots";
          finder.FXPreferredViewStyle = "clmv";
          controlcenter.BatteryShowPercentage = true;
          controlcenter.Sound = true;
          menuExtraClock.ShowSeconds = true;
        };

        services.nix-daemon.enable = true;

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Enable alternative shell support in nix-darwin.
        programs.zsh.enable = true;
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."tsukuyomi" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "szukyu";
              autoMigrate = true;
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.szukyu = import ./home.nix;
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."tsukuyomi".pkgs;
    };
}
