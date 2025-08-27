return {
	{
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v3.x",
			lazy = true,
			config = false,
			init = function()
				-- Disable automatic setup, we are doing it manually
				vim.g.lsp_zero_extend_cmp = 0
				vim.g.lsp_zero_extend_lspconfig = 0
			end,
		},
		{
			"williamboman/mason.nvim",
			lazy = false,
			config = true,
		},

		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			dependencies = {
				{ "L3MON4D3/LuaSnip" },
			},
			config = function()
				-- Here is where you configure the autocompletion settings.
				local lsp_zero = require("lsp-zero")
				lsp_zero.extend_cmp()

				-- And you can configure cmp even more, if you want to.
				local cmp = require("cmp")
				local cmp_action = lsp_zero.cmp_action()

				cmp.setup({
					formatting = lsp_zero.cmp_format({ details = true }),
					mapping = cmp.mapping.preset.insert({
						["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
						["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
						["<C-k>"] = cmp.mapping.select_prev_item(),
						["<C-j>"] = cmp.mapping.select_next_item(),
						["<C-b>"] = cmp.mapping.scroll_docs(-1),
						["<C-f>"] = cmp.mapping.scroll_docs(1),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-y>"] = cmp.config.disable, -- removes default <C-y> behavior
						["<C-e>"] = cmp.mapping({
							i = cmp.mapping.abort(),
							c = cmp.mapping.close(),
						}),
						["<C-CR>"] = function(fallback)
							cmp.abort()
							fallback()
						end,
						["<tab>"] = function(fallback)
							return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
						end,
					}),
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
				})
			end,
		},

		-- LSP
		{
			"neovim/nvim-lspconfig",
			cmd = { "LspInfo", "LspInstall", "LspStart" },
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "williamboman/mason-lspconfig.nvim" },
			},
			config = function()
				-- This is where all the LSP shenanigans will live
				local lsp_zero = require("lsp-zero")
				lsp_zero.extend_lspconfig()

				-- if you want to know more about mason.nvim
				-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
				lsp_zero.on_attach(function(client, bufnr)
					-- see :help lsp-zero-keybindings
					-- to learn the available actions
					lsp_zero.default_keymaps({ buffer = bufnr })
				end)

				require("mason-lspconfig").setup({
					ensure_installed = {},
					handlers = {
						-- this first function is the "default handler"
						-- it applies to every language server without a "custom handler"
						function(server_name)
							require("lspconfig")[server_name].setup({})
						end,

						-- this is the "custom handler" for `lua_ls`
						lua_ls = function()
							-- (Optional) Configure lua language server for neovim
							local lua_opts = lsp_zero.nvim_lua_ls()
							require("lspconfig").lua_ls.setup(lua_opts)
						end,
					},
				})
			end,
		},
	},
}
