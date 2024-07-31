local option = vim.opt

option.guicursor = ""

option.number = true
option.relativenumber = true

option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.autoindent = true

option.wrap = false

option.ignorecase = true
option.smartcase = true

option.termguicolors = true

option.backspace = "indent,eol,start"

option.clipboard:append("unnamedplus")

option.cursorline = true

option.splitright = true
option.splitbelow = true

option.scrolloff = 8
option.signcolumn = "yes"
option.isfname:append("@-@")

option.showtabline = 0

option.updatetime = 50

option.swapfile = false
option.backup = false
option.undodir = os.getenv("HOME") .. "/.dotfiles/nvim/.config/nvim/undodir"
option.undofile = true
