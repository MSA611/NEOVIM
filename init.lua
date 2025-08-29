require("config.options")
require("config.keymaps")
require("config.lazy")
vim.uv = vim.uv or vim.loop

local M = {}

---@param opts? LazyVimConfig
function M.setup(opts)
	require("lazyvim.config").setup(opts)
end

return M
