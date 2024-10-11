return {
	-- Add more adapters here to lazy load
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {},
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(python_path)
		end,
	},
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle [D]ebugger [B]reakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "[D]ebugger run to [C]ursor",
			},
			{
				"<leader>d?",
				function()
					---@diagnostic disable-next-line: missing-fields
					require("dapui").eval(nil, { enter = true })
				end,
				desc = "Debug Evaluate",
			},
			{
				"<F1>",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: Step Into",
			},
			{
				"<F2>",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: Step Over",
			},
			{
				"<F3>",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: Step Out",
			},
			{
				"<F4>",
				function()
					require("dap").step_back()
				end,
				desc = "Debug: Step Back",
			},
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debug: Start/Continue",
			},
			{
				"<F6>",
				function()
					require("dap").restart()
				end,
				desc = "Debug: Restart",
			},
			{
				"<F7>",
				function()
					require("dapui").toggle()
				end,
				desc = "Debug: See last session result",
			},
			{
				"q",
				function()
					require("dapui").close()
				end,
				desc = "Debug: Close",
			},
		},
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",

			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				automatic_installation = true,
				handlers = {},
				ensure_installed = {
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

			---@diagnostic disable-next-line: missing-fields
			dapui.setup({
				active = true,
				on_config_done = nil,
				breakpoint = {
					text = "",
					texthl = "DiagnosticSignError",
					linehl = "",
					numhl = "",
				},
				breakpoint_rejected = {
					text = "",
					texthl = "DiagnosticSignError",
					linehl = "",
					numhl = "",
				},
				stopped = {
					text = "",
					texthl = "DiagnosticSignWarn",
					linehl = "Visual",
					numhl = "DiagnosticSignWarn",
				},
				log = {
					level = "info",
				},
				ui = {
					auto_open = true,
					notify = {
						threshold = vim.log.levels.INFO,
					},
					config = {
						mappings = {
							-- Use a table to apply multiple mappings
							expand = { "<CR>", "<2-LeftMouse>" },
							open = "o",
							remove = "d",
							edit = "e",
							repl = "r",
							toggle = "t",
						},
						-- Use this to override mappings for specific elements
						element_mappings = {},
						expand_lines = true,
						layouts = {
							{
								elements = {
									{ id = "scopes", size = 0.33 },
									{ id = "breakpoints", size = 0.17 },
									{ id = "stacks", size = 0.25 },
									{ id = "watches", size = 0.25 },
								},
								size = 0.33,
								position = "right",
							},
							{
								elements = {
									{ id = "repl", size = 0.45 },
									{ id = "console", size = 0.55 },
								},
								size = 0.27,
								position = "bottom",
							},
						},
						controls = {
							enabled = true,
							-- Display controls in this element
							element = "repl",
						},
						floating = {
							max_height = 0.9,
							max_width = 0.5, -- Floats will be treated as percentage of your screen.
							border = "rounded",
							mappings = {
								close = { "q", "<Esc>" },
							},
						},
						windows = { indent = 1 },
						render = {
							max_type_length = nil, -- Can be integer or nil.
							max_value_lines = 100, -- Can be integer or nil.
						},
					},
				},
			})

			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})
			vim.fn.sign_define("DapStopped", { text = "", texthl = "WarningMsg", linehl = "", numhl = "" })

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
