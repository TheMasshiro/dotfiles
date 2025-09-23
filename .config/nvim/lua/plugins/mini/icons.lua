return function()
	local MiniIcons = require("mini.icons")

	MiniIcons.setup()

	package.preload["nvim-web-devicons"] = function()
		MiniIcons.mock_nvim_web_devicons()
		return package.loaded["nvim-web-devicons"]
	end
end
