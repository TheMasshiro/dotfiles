local keymap = vim.keymap

keymap.set({ "i", "n" }, "<esc>", "<esc>:nohlsearch<CR>", { silent = true, desc = "clear search highlight" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected lines up" })

keymap.set("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename all variables" })
