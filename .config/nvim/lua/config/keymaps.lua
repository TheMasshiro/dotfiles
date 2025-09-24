-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit Insert Mode
-- ThePrimeagen
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Move highlighted lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected lines up" })

-- Exit Terminal Mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- LSP
-- Code action
vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "Code Action" })
-- Rename Symbol
vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })
-- Toggle Inlay Hints
vim.keymap.set("n", "\\bh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- Close current buffer
vim.keymap.set("n", "<leader>bd", "<CMD>bdelete<CR>", { silent = true, desc = "Close Current Buffer" })

-- Create vertical windows
vim.keymap.set("n", "\\v", "<CMD>vnew<CR>", { silent = true, desc = "Vertical split" })
vim.keymap.set("n", "<A-l>", "<CMD>vertical resize +5<CR>", { silent = true, desc = "Increase split width" })
vim.keymap.set("n", "<A-h>", "<CMD>vertical resize -5<CR>", { silent = true, desc = "Decrease split width" })
