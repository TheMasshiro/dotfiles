return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
		"InsertLeave",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- C/C++
			c = { "cpplint" },
			cpp = { "cpplint" },
			-- Python
			python = { "ruff" },
			-- GO
			go = { "golangcilint" },
			-- JS/TS
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

		local lint_auroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_auroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>bl", function()
			lint.try_lint()
		end, { desc = "Lint Buffer (Linter)" })
	end,
}
