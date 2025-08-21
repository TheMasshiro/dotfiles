return function()
	require("mini.pairs").setup({
		modes = { insert = true, command = false, terminal = false },
		mappings = {
			[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
			["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
			["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
			["["] = {
				action = "open",
				pair = "[]",
				neigh_pattern = ".[%s%z%)}%]]",
				register = { cr = false },
			},
			["{"] = {
				action = "open",
				pair = "{}",
				neigh_pattern = ".[%s%z%)}%]]",
				register = { cr = false },
			},
			["("] = {
				action = "open",
				pair = "()",
				neigh_pattern = ".[%s%z%)]",
				register = { cr = false },
			},
			['"'] = {
				action = "closeopen",
				pair = '""',
				neigh_pattern = "[^%w\\][^%w]",
				register = { cr = false },
			},
			["'"] = {
				action = "closeopen",
				pair = "''",
				neigh_pattern = "[^%w\\][^%w]",
				register = { cr = false },
			},
			["`"] = {
				action = "closeopen",
				pair = "``",
				neigh_pattern = "[^%w\\][^%w]",
				register = { cr = false },
			},
		},
	})
end
