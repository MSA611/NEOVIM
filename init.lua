require("config.keymaps")
require("config.lazy")
require("config.options")

require("toggleterm").setup({
	direction = "float",
	float_opts = {
		border = "curved", -- You can choose "single", "double", "curved", "shadow" or "none"
	},
})
