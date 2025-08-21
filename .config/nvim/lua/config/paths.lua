local M = {}
local data_dir = vim.fn.stdpath("data")
M.nvim = {
    mason = data_dir .. "/mason/bin/",
}
M.formatters = {
    isort = {
        command = M.nvim.mason .. "isort",
        args = {
            "-",
        },
    },
    ruff_format = {
        command = M.nvim.mason .. "ruff",
        args = { "format", "-" },
    },
    stylua = {
        command = M.nvim.mason .. "stylua",
    },
    ["clang-format"] = {
        command = M.nvim.mason .. "clang-format",
    },
    prettierd = {
        command = M.nvim.mason .. "prettierd",
    },
    ["php-cs-fixer"] = {
        command = M.nvim.mason .. "php-cs-fixer",
    },
    djlint = {
        command = M.nvim.mason .. "djlint",
    },
}
M.data_dir = data_dir
return M
