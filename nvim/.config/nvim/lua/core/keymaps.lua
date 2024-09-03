local keymap = vim.keymap

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected lines up" })

keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

keymap.set("n", "<leader>vv", [[:vsplit | terminal<CR>A]], { desc = "Open terminal in [V]ertical split" })
keymap.set("n", "<leader>vh", [[:split | terminal<CR>A]], { desc = "Open terminal in [H]orizontal split" })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal insert mode" })
