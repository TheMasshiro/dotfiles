return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "htmldjango", "tmpl", "gotmpl", "template" },
	single_file_support = true,
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	},
}
