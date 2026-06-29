return {
	"elmcgill/springboot-nvim",
	ft = "java",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-jdtls",
	},
	config = function()
		local springboot_nvim = require("springboot-nvim")
		local wk = require("which-key")

		springboot_nvim.setup({})

		wk.add({
			{ "<leader>J", group = "Spring Boot", buffer = 0, icon = "🍃" },
			{ "<leader>Jr", springboot_nvim.boot_run, desc = "Run Project", buffer = 0 },
			{ "<leader>Jc", springboot_nvim.generate_class, desc = "Create Class", buffer = 0 },
			{ "<leader>Ji", springboot_nvim.generate_interface, desc = "Create Interface", buffer = 0 },
			{ "<leader>Je", springboot_nvim.generate_enum, desc = "Create Enum", buffer = 0 },
		})
	end,
}
