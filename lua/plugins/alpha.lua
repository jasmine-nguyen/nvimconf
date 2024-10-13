return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[   _    _                   _            ]],
			[[  | |  | |                 | |           ]],
			[[  | |__| | ___ _   _       | | __ _ ___  ]],
			[[  |  __  |/ _ \ | | |  _   | |/ _` / __| ]],
			[[  | |  | |  __/ |_| | | |__| | (_| \__ \ ]],
			[[  |_|  |_|\___|\__, |  \____/ \__,_|___/ ]],
			[[                __/ |                    ]],
			[[               |___/                     ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", " 📁  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", " 🔎  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
			dashboard.button("r", " ⌛  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", " 💣  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", " 🚪  > Quit NVIM", ":qa<CR>"),
		}
		require("alpha").setup(dashboard.config)
	end,
}
