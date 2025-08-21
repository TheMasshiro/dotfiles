-- Indentation settings: use 4 spaces for tabs and related operations
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- convert tabs to spaces

-- Line numbers: show both absolute and relative
vim.opt.number = true
vim.opt.relativenumber = true

-- GUI cursor: force block cursor style in all modes
vim.opt.guicursor = ""

-- Enable mouse support in all modes
vim.opt.mouse = "a"

-- Don't show current mode (handled by statusline)
vim.opt.showmode = false


-- Use win32yank for wsl
vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = true,
}

-- Sync system clipboard with Neovim
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Indentation visual aid for wrapped lines
vim.opt.breakindent = true

-- Save undo history across sessions
vim.opt.undofile = true

-- Disable backup and swap files
vim.opt.backup = false
vim.opt.swapfile = false

-- Case-insensitive search unless uppercase used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always show the sign column (useful for git/linting signs)
vim.opt.signcolumn = "yes"

-- Keep cursor centered with padding when scrolling
vim.opt.scrolloff = 10

-- Faster completion and response time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Split window behavior tweaks
vim.opt.splitkeep = "screen" -- preserve scroll context when splitting
vim.opt.laststatus = 3 -- global statusline

-- Open new splits to the right and below by default
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Live preview of :substitute command
vim.opt.inccommand = "split"

-- Highlight the current line
vim.opt.cursorline = true

-- Enable 24-bit RGB color in terminal
vim.opt.termguicolors = true

-- Prompt to save on quit if changes are unsaved
vim.opt.confirm = true

