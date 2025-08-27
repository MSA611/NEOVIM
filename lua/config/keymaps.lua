vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ timeout_ms = 3000 })
end, { desc = "Format file or selection" })

vim.keymap.set("n", "<C-t>", "<Cmd>ToggleTerm dir=%:p:h<CR>", { desc = "ToggleTerm float " })
vim.keymap.set("t", "<C-t>", "<Cmd>ToggleTerm dir=%:p:h<CR>", { desc = "ToggleTerm float" })
vim.keymap.set({"n","v"},"y",[["+y]])
