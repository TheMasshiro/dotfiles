require("config.lazy")
require("config.autocmd")
require("config.keymaps")
require("config.lsp")

-- `LSP hover`, `Diagnostics`, `Quickfix`, `Beacon` etc. should be loaded first.
require("scripts.lsp_hover").setup()
require("scripts.diagnostics").setup()
require("scripts.quickfix").setup()
require("scripts.beacon").setup()

-- Load scripts that rely on `plugin`s.
require("scripts.highlights").setup()
require("scripts.color_sync")
require("scripts.tree").setup()
require("scripts.ts_regen").setup()

require("scripts.color").setup()

-- vim.api.nvim_create_autocmd({
-- 	"VimEnter",
-- 	"ColorScheme",
-- }, {
-- 	callback = function()
-- 		_G.disable_properties()
-- 		require("scripts.highlights").setup()
-- 	end,
-- })
