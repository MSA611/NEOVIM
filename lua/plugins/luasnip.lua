return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		event = "InsertEnter",
		config = function()
			local luasnip = require("luasnip")
			-- Load snippets from friendly-snippets if you want
			-- require("luasnip.loaders.from_vscode").lazy_load()
			-- Basic configuration
			luasnip.config.setup({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})
		end,
	},
}

