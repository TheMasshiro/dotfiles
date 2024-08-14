return {
	-- Depending on filetypes
	{
		"mfussenegger/nvim-dap",
		ft = { "go", "python" },
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",

			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Adapter
			{
				"leoluz/nvim-dap-go",
				ft = "go",
			},
			{
				"mfussenegger/nvim-dap-python",
				ft = "python",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			-- Python
			local python_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(python_path)

			-- Go
			require("dap-go").setup()

			require("mason-nvim-dap").setup({
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- You'll need to check that you have the required things installed
				-- online, please don't ask me how to install them :)
				ensure_installed = {
					-- Update this to ensure that you have the debuggers for the langs you want
					"delve",
					"python",
				},
			})

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
				dapui.eval(nil, { enter = true })
			end, { desc = "Debug Evaluate (DAP)" })

			vim.keymap.set("n", "<F9>", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<F4>", dap.step_back, { desc = "Debug: Step Back" })
			vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result" })
			vim.keymap.set("n", "<F8>", dap.restart, { desc = "Debug: Restart" })
			vim.keymap.set("n", "<F10>", dapui.close, { desc = "Debug: Close" })

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
		end,
	},
}
