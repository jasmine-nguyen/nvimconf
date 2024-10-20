return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-material-icon" },
	config = function()
		local startify = require("alpha.themes.startify")
		startify.section.header.val = {
			[[ _   _                ___           _ ]],
			[[| | | |              |_  |         | |]],
			[[| |_| | ___ _   _      | | __ _ ___| |]],
			[[|  _  |/ _ \ | | |     | |/ _` / __| |]],
			[[| | | |  __/ |_| | /\__/ / (_| \__ \_|]],
			[[\_| |_/\___|\__, | \____/ \__,_|___(_)]],
			[[             __/ |                    ]],
			[[            |___/                     ]],
		}
		startify.file_icons.provider = "devicons"
		require("alpha").setup(startify.config)
	end,
}
