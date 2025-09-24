return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "setup.py", "pyproject.toml", "requirements.txt", ".venv" },
	settings = {
		basedpyright = {
			analysis = {
				useLibraryCodeForTypes = true,
				autoSearchPath = true,
				typeCheckingMode = "basic",
				diagnosticMode = "workspace",

				inlayHints = {
					callArgumentNames = true,
				},
			},
		},
	},
	single_file_support = true,
}
