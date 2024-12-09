return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		local kind_icons = {
			Text = "󰦨",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "",
			Variable = "",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					scrollbar = false,
					max_width = 1,
					max_height = 1,
				}),
				documentation = cmp.config.window.bordered()
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if cmp.get_selected_entry() == nil then
							cmp.select_next_item()
							cmp.confirm()
						else
							cmp.confirm()
						end
					else
						fallback()
					end
				end, {'i', 's'}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp"},
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				fields = { 'kind', 'abbr', 'menu'},
				format = function(_, item)
					local label_width = 45
					local label = item.abbr
					local truncated_label = vim.fn.strcharpart(label, 0, label_width)

					if truncated_label ~= label then
						item.abbr = truncated_label.. "..."
					elseif string.len(label) < label_width then
						local padding = string.rep(" ", label_width - string.len(label))
						item.abbr = label .. padding
					end

					item.menu = item.kind
					item.kind = kind_icons[item.kind]
					return item
				end,
			},
		})
	end,
}
