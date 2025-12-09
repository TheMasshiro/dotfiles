require("config.lazy")
require("config.autocmd")
require("config.keymaps")
require("config.lsp")

require("scripts.beacon").setup()
require("scripts.diagnostics").setup()
require("scripts.highlights").setup()
require("scripts.lsp_hover").setup()
