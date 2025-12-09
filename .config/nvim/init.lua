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
require("scripts.tree").setup()
require("scripts.ts_regen").setup()
