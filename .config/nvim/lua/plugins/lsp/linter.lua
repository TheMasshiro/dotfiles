return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			c = { "cpplint" },
			cpp = { "cpplint" },
			php = { "phpcs" },
			python = { "ruff" },

			-- Web Things
			htmldjango = { "djlint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
		}

		local cpp = lint.linters.cpplint
		cpp.args = {
			"--filter=-legal/copyright",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if vim.opt_local.modifiable:get() then
					lint.try_lint()
				end
			end,
		})
	end,
}
