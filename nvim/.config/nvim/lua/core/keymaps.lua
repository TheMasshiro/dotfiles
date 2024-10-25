-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit Inset Mode
-- ThePrimeagen
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Move highlighted lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected lines up" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Terminal mode
vim.keymap.set("n", "<leader>vv", [[:vsplit | terminal<CR>A]], { desc = "Open terminal in [V]ertical split" })
vim.keymap.set("n", "<leader>vh", [[:split | terminal<CR>A]], { desc = "Open terminal in [H]orizontal split" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
