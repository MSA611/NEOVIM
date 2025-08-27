return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			require("onedarkpro").setup({
				theme = "onedark_dark",
			})
			vim.cmd("colorscheme onedark_dark")
		end,
	},
}
