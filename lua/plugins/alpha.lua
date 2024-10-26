return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local startify = require("alpha.themes.startify")
		startify.section.header.val = {
			[[   ____ _     _ _ _                   _   _           _ _     _ ]],
			[[  / ___| |__ (_) | |   __ _ _ __   __| | | |__  _   _(_) | __| |]],
			[[ | |   | '_ \| | | |  / _` | '_ \ / _` | | '_ \| | | | | |/ _` |]],
			[[ | |___| | | | | | | | (_| | | | | (_| | | |_) | |_| | | | (_| |]],
			[[  \____|_| |_|_|_|_|  \__,_|_| |_|\__,_| |_.__/ \__,_|_|_|\__,_|]],
		}
		startify.file_icons.provider = "devicons"
		require("alpha").setup(startify.config)
	end,
}
