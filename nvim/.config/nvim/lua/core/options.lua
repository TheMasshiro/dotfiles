local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2

opt.number = true
opt.relativenumber = true

opt.guicursor = ""
opt.mouse = "a"
opt.showmode = false

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

opt.breakindent = true

opt.undofile = true
opt.backup = false
opt.swapfile = false

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"
opt.scrolloff = 10

opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.inccommand = "split"

opt.cursorline = true

opt.termguicolors = true
