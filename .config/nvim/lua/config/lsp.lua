local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

vim.lsp.config("*", {
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	}),
	root_markers = { ".git" },
})

vim.lsp.enable({
	"basedpyright",
	"clangd",
	"css",
	"emmet",
	"html",
	"intelephense",
	"luals",
	"ruff",
	"tsls",
})

vim.diagnostic.config({
	severity_sort = true,
	underline = true,
	update_in_insert = false,
	virtual_text = true,
	virtual_lines = { current_line = true },
})
