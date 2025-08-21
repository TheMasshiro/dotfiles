local mason_path = require("config.paths").nvim.mason

return {
	cmd = {
		mason_path .. "clangd",
		"--background-index",
		"--fallback-style=llvm",
	},
	filetypes = { "c", "cpp", "h", "hpp" },
	root_markers = { ".clangd" },
}
