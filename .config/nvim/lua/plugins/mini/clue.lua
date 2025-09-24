return function()
	local mini_clue = require("mini.clue")

	mini_clue.setup({
		triggers = {
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },

			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },

			{ mode = "n", keys = "s" },
			{ mode = "x", keys = "s" },

			{ mode = "n", keys = "[" },
			{ mode = "x", keys = "[" },
			{ mode = "n", keys = "]" },
			{ mode = "x", keys = "]" },

			{ mode = "n", keys = "\\" },
			{ mode = "x", keys = "\\" },

			{ mode = "x", keys = "a" },
			{ mode = "o", keys = "a" },

			{ mode = "x", keys = "i" },
			{ mode = "o", keys = "i" },
		},

		clues = {
			mini_clue.gen_clues.builtin_completion(),
			mini_clue.gen_clues.g(),
			mini_clue.gen_clues.marks(),
			mini_clue.gen_clues.registers(),
			mini_clue.gen_clues.windows(),
			mini_clue.gen_clues.z(),

			{ mode = "n", keys = "<Leader>b", desc = "+Bufferline" },
			{ mode = "n", keys = "<Leader>f", desc = "+File/Find" },
			{ mode = "n", keys = "<Leader>g", desc = "+Git" },
			{ mode = "n", keys = "<Leader>h", desc = "+Git Hunks" },
			{ mode = "n", keys = "<Leader>l", desc = "+LSP" },
			{ mode = "n", keys = "<Leader>s", desc = "+Search" },
			{ mode = "n", keys = "<Leader>w", desc = "+Diagnostics" },
			{ mode = "n", keys = "<Leader>z", desc = "+Scratch/Zen" },
			{ mode = "n", keys = "\\n", desc = "+Notifications" },
			{ mode = "n", keys = "\\b", desc = "+Buffers" },
		},

		window = {
			delay = 200,
		},
	})
end
