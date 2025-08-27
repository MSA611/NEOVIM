return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			require("onedarkpro").setup({
				theme = "onedark_dark",
				highlights = {
					-- OneDark Pro DARK theme completion menu with yellow selector

					CmpPmenu = { bg = "#1e2127", fg = "#abb2bf" },
					CmpSel = { bg = "#e5c07b", fg = "#1e2127", bold = true },
					CmpDoc = { bg = "#1e2127", fg = "#abb2bf" },
					-- OneDark Pro colors for completion types
					CmpItemKindSnippet = { fg = "#e06c75" },
					CmpItemKindKeyword = { fg = "#c678dd" },
					CmpItemKindText = { fg = "#abb2bf" },
					CmpItemKindMethod = { fg = "#61afef" },
					CmpItemKindConstructor = { fg = "#61afef" },
					CmpItemKindFunction = { fg = "#61afef" },
					CmpItemKindFolder = { fg = "#61afef" },
					CmpItemKindModule = { fg = "#e5c07b" },
					CmpItemKindConstant = { fg = "#d19a66" },
					CmpItemKindField = { fg = "#e06c75" },
					CmpItemKindProperty = { fg = "#e06c75" },
					CmpItemKindEnum = { fg = "#e5c07b" },
					CmpItemKindUnit = { fg = "#d19a66" },
					CmpItemKindClass = { fg = "#e5c07b" },
					CmpItemKindVariable = { fg = "#e06c75" },
					CmpItemKindFile = { fg = "#61afef" },
					CmpItemKindInterface = { fg = "#e5c07b" },
					CmpItemKindColor = { fg = "#d19a66" },
					CmpItemKindReference = { fg = "#e06c75" },
					CmpItemKindEnumMember = { fg = "#e5c07b" },
					CmpItemKindStruct = { fg = "#e5c07b" },
					CmpItemKindValue = { fg = "#d19a66" },
					CmpItemKindEvent = { fg = "#e5c07b" },
					CmpItemKindOperator = { fg = "#56b6c2" },
					CmpItemKindTypeParameter = { fg = "#e5c07b" },
				},
			})
			vim.cmd("colorscheme onedark_dark")
		end,
	},
}
