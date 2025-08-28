return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			-- Lua: Stylua formatter
			lua = { "stylua" },

			-- Clang-format support for C-family languages
			c = { "clang-format" },
			cpp = { "clang-format" },
			java = { "clang-format" },
			objc = { "clang-format" },
			objcxx = { "clang-format" },

			-- Python: isort for imports, black for formatting
			python = { "isort", "black" },

			-- Rust: rustfmt, fallback to LSP if not available
			rust = { "rustfmt", lsp_format = "fallback" },

			-- Go: goimports, gofumpt for formatting
			go = { "goimports", "gofumpt" },

			-- Shell: shfmt for shell scripts
			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },
			fish = { "fish_indent" }, -- fish shell

			-- Prettier-family for web & markup
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			vue = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			jsonc = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			graphql = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			scss = { "prettierd", "prettier", stop_after_first = true },
			less = { "prettierd", "prettier", stop_after_first = true },

			-- Additional common formatters
			terraform = { "terraform_fmt" },
			xml = { "xmlformat" },
			sql = { "sqlformat" }, -- requires sqlformat or similar installed
			ruby = { "rubocop" }, -- rubocop for Ruby

			-- Dart: dart format tool
			dart = { "dart_format" },

			-- Miscellaneous language support
			toml = { "taplo" },
			hcl = { "terraform_fmt" }, -- HCL uses terraform_fmt
			kotlin = { "ktlint" }, -- Ktlint for Kotlin files
			php = { "php_cs_fixer" }, -- PHP CS Fixer for PHP files
			perl = { "perltidy" },

			-- Editorconfig support (common formatting standard)
			["*"] = { "editorconfig" }, -- Fallback for any filetype
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
