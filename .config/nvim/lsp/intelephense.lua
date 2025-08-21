local mason_path = require("config.paths").nvim.mason

return {
	cmd = { mason_path .. "intelephense" },
	filetypes = { "php" },
	root_markers = {
		"composer.json",
	},
}
