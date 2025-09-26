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
		args = {
			"fix",
			"$FILENAME",
			"--config=" .. os.getenv("HOME") .. "/.php-cs-fixer.dist.php",
		},
		stdin = false,
	},
	djlint = {
		command = "djlint",
	},
}

return M
