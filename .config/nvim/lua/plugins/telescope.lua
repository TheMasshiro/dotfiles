---@module 'lazy'
---@type LazySpec
return {
	-- [[ Fuzzy Finder (files, lsp, etc) ]]
	--
	-- Telescope is a fuzzy finder that comes with a lot of different things that
	-- it can fuzzy find! It's more than just a "file finder", it can search
	-- many different aspects of Neovim, your workspace, LSP, and more!
	--
	-- There are lots of other alternative pickers (like snacks.picker, or fzf-lua)
	-- so feel free to experiment and see what you like!
	--
	-- The easiest way to use Telescope, is to start by doing something like:
	--  :Telescope help_tags
	--
	-- After running this command, a window will open up and you're able to
	-- type in the prompt window. You'll see a list of `help_tags` options and
	-- a corresponding preview of the help.
	--
	-- Two important keymaps to use while in Telescope are:
	--  - Insert mode: <c-/>
	--  - Normal mode: ?
	--
	-- This opens a window that shows you all of the keymaps for the current
	-- Telescope picker. This is really useful to discover what Telescope can
	-- do as well as how to actually do it!
	"nvim-telescope/telescope.nvim",
	enabled = true,
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- Telescope is a fuzzy finder that comes with a lot of different things that
		-- it can fuzzy find! It's more than just a "file finder", it can search
		-- many different aspects of Neovim, your workspace, LSP, and more!
		--
		-- The easiest way to use Telescope, is to start by doing something like:
		--  :Telescope help_tags
		--
		-- After running this command, a window will open up and you're able to
		-- type in the prompt window. You'll see a list of `help_tags` options and
		-- a corresponding preview of the help.
		--
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			-- defaults = {
			--   mappings = {
			--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			--   },
			-- },
			-- pickers = {}
			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown() },
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
		vim.keymap.set({ "n", "v" }, "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
		vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "[F]ind [C]ommands" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
		-- it is better explained there). This allows easily switching between pickers if you prefer using something else!
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
			callback = function(event)
				local buf = event.buf

				-- Find references for the word under your cursor.
				vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })

				-- Jump to the implementation of the word under your cursor.
				-- Useful when your language has ways of declaring types without an actual implementation.
				vim.keymap.set(
					"n",
					"gri",
					builtin.lsp_implementations,
					{ buffer = buf, desc = "[G]oto [I]mplementation" }
				)

				-- Jump to the definition of the word under your cursor.
				-- This is where a variable was first declared, or where a function is defined, etc.
				-- To jump back, press <C-t>.
				vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })

				-- Fuzzy find all the symbols in your current document.
				-- Symbols are things like variables, functions, types, etc.
				vim.keymap.set(
					"n",
					"gO",
					builtin.lsp_document_symbols,
					{ buffer = buf, desc = "Open Document Symbols" }
				)

				-- Fuzzy find all the symbols in your current workspace.
				-- Similar to document symbols, except searches over your entire project.
				vim.keymap.set(
					"n",
					"gW",
					builtin.lsp_dynamic_workspace_symbols,
					{ buffer = buf, desc = "Open Workspace Symbols" }
				)

				-- Jump to the type of the word under your cursor.
				-- Useful when you're not sure what type a variable is and you want to see
				-- the definition of its *type*, not where it was *defined*.
				vim.keymap.set(
					"n",
					"grt",
					builtin.lsp_type_definitions,
					{ buffer = buf, desc = "[G]oto [T]ype Definition" }
				)
			end,
		})

		-- Override default behavior and theme when searching
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[F]ind [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [N]eovim files" })
	end,
}
