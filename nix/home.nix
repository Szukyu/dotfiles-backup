{ config, pkgs, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  programs.home-manager.enable = true;

  home.username = "szukyu";
  home.homeDirectory = "/Users/szukyu";
  xdg.enable = true;

  xdg.configFile.nvim.source = mkOutOfStoreSymlink "/Users/szukyu/.dotfiles/nvim";

  home.stateVersion = "23.11";
}
