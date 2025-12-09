local snacks_opts = {
	bigfile = { enabled = true },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
}

local snacks_init = function()
	vim.g.snacks_animate = false

	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		callback = function()
			-- Setup some globals for debugging (lazy-loaded)
			_G.dd = function(...)
				Snacks.debug.inspect(...)
			end
			_G.bt = function()
				Snacks.debug.backtrace()
			end

			-- Override print to use snacks for `:=` command
			if vim.fn.has("nvim-0.11") == 1 then
				vim._print = function(_, ...)
					dd(...)
				end
			else
				vim.print = _G.dd
			end
		end,
	})
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = snacks_opts,
	init = snacks_init,
}
