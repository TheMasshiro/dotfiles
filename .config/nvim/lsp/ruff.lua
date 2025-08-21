local mason_path = require("config.paths").nvim.mason

return {
	cmd = { mason_path .. "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "setup.py", "pyproject.toml", "requirements.txt", ".venv" },
	init_options = {
		settings = {
			organizeImports = true,
			showSyntaxErrors = true,
			codeAction = {
				disableRuleComment = { enable = false },
				fixViolation = { enable = false },
			},
			lint = {
				enable = true,
			},
		},
	},
	single_file_support = true,
}
