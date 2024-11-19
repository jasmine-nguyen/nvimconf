return {
	"goolord/alpha-nvim",
	enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local startify = require("alpha.themes.startify")
		startify.section.header.val = {
			[[  _   _      _ _        __        __         _     _ _  ]],
			[[ | | | | ___| | | ___   \ \      / /__  _ __| | __| | | ]],
			[[ | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | | ]],
			[[ |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_| ]],
			[[ |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_) ]],
		}
		startify.file_icons.provider = "devicons"
		require("alpha").setup(startify.config)
	end,
}
