local mason_path = require("config.paths").nvim.mason

return {
	cmd = { mason_path .. "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "sass", "scss", "less" },
}
