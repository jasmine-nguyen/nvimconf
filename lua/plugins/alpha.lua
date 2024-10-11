return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local startify = require("alpha.themes.startify")
    startify.file_icons.provider = "devicons"
    startify.section.header.val = {
      [[   _    _                   _            ]],
      [[  | |  | |                 | |           ]],
      [[  | |__| | ___ _   _       | | __ _ ___  ]],
      [[  |  __  |/ _ \ | | |  _   | |/ _` / __| ]],
      [[  | |  | |  __/ |_| | | |__| | (_| \__ \ ]],
      [[  |_|  |_|\___|\__, |  \____/ \__,_|___/ ]],
      [[                __/ |                    ]],
      [[               |___/                     ]],
    }
    require("alpha").setup(startify.config)
  end,
}
