return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" }, -- More reliable events
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Setup mason first
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					-- Add other servers you want here
				},
			})

			-- Setup capabilities for completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- Try to enhance with cmp capabilities if available
			local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
			end

			-- Setup diagnostic configuration
			vim.diagnostic.config({
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
				signs = true,
			})

			-- Define diagnostic signs
			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- LSP keymaps function
			local function on_attach(client, bufnr)
				local opts = { buffer = bufnr, silent = true }
				-- Key mappings
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end

			-- Server configurations
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							codeLens = {
								enable = true,
							},
							completion = {
								callSnippet = "Replace",
							},
							doc = {
								privateName = { "^_" },
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
						},
					},
				},
				-- Add other server configurations here
			}

			-- Setup servers
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local server_config = servers[server_name] or {}
					server_config.capabilities = capabilities
					server_config.on_attach = on_attach
					require("lspconfig")[server_name].setup(server_config)
				end,
			})
		end,
	},
}

