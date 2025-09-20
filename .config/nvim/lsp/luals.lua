return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				disable = {
					"missing-parameter",
					"missing-fields",
					"unused-function",
				},
				globals = { "vim", "Snacks" },
				undefined_global = false,
			},
			root_markers = { ".luarc.json", "luarc.lua", ".git" },
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				ignoreDir = { ".git" },
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					vim.api.nvim_get_runtime_file("lua", true),
				},
			},
			single_file_support = true,
		},
	},
}
