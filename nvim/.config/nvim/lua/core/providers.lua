local provider = vim.g

-- Python Provider
local python_provider = ".local/share/mise/installs/python/latest/bin/python"
provider.python3_host_prog = vim.fn.expand("$HOME/") .. python_provider
