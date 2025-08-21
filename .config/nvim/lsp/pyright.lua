local mason_path = require("config.paths").nvim.mason

return {
	cmd = { mason_path .. "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "setup.py", "pyproject.toml", "requirements.txt", ".venv" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
	single_file_support = true,
}
