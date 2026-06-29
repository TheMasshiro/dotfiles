---@module 'lazy'
---@type LazySpec
return {
	-- [[ mini.nvim ]]
	--  A collection of various small independent plugins/modules
	"nvim-mini/mini.nvim",
	keys = {
		{
			"\\f",
			"<Cmd>silent! lua MiniFiles.open()<CR>",
			desc = "[F]ile Explorer",
		},
	},
	config = function()
		-- If a nerd font is available, load the icons module for pretty icons in various plugins.
		if vim.g.have_nerd_font then
			require("mini.icons").setup()
			-- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
			MiniIcons.mock_nvim_web_devicons()
		end

		require("config.mini.ai").setup()
		require("config.mini.files").setup()
		require("config.mini.pairs").setup()
		require("config.mini.surround").setup()
		require("config.mini.trailspace").setup()

		-- ... and there is more!
		--  Check out: https://github.com/nvim-mini/mini.nvim
	end,
}
