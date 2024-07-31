return {
	"mfussenegger/nvim-dap",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		-- Debuggers
		{
			"mfussenegger/nvim-dap-python",
			event = { "BufReadPre", "BufNewFile" },
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		-- Debuggers
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		require("nvim-dap-virtual-text").setup({
			-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
			display_callback = function(variable)
				local name = string.lower(variable.name)
				local value = string.lower(variable.value)
				if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
					return "*****"
				end

				if #variable.value > 15 then
					return " " .. string.sub(variable.value, 1, 15) .. "... "
				end

				return " " .. variable.value
			end,
		})

		vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { desc = "Toggle Debugger Breakpoint (DAP)" })
		vim.keymap.set("n", "<space>dg", dap.run_to_cursor, { desc = "Debugger Run to Cursor (DAP)" })

		vim.keymap.set("n", "<space>d?", function()
			require("dapui").eval(nil, { enter = true })
		end, { desc = "Debug Evaluate (DAP)" })

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_into)
		vim.keymap.set("n", "<F3>", dap.step_over)
		vim.keymap.set("n", "<F4>", dap.step_out)
		vim.keymap.set("n", "<F5>", dap.step_back)
		vim.keymap.set("n", "<F9>", dap.restart)
		vim.keymap.set("n", "<F10>", dapui.close)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
	end,
}
