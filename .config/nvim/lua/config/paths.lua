local M = {}

M.formatters = {
	isort = {
		command = "isort",
		args = { "-" },
	},
	ruff_format = {
		command = "ruff",
		args = { "format", "-" },
	},
	black = {
		command = "black",
	},
	stylua = {
		command = "stylua",
	},
	["clang-format"] = {
		command = "clang-format",
	},
	prettierd = {
		command = "prettierd",
	},
	["php-cs-fixer"] = {
		command = "php-cs-fixer",
	},
	djlint = {
		command = "djlint",
	},
}

return M
