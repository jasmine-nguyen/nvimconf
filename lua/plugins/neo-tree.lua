return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "BurntSushi/ripgrep",
  },
  config = function()
    vim.keymap.set("n", "\\", ":Neotree filesystem toggle left<CR>")
    vim.keymap.set("n", "<leader>f", ":Neotree source=filesystem focus<CR>")
  end,
  keys = {
    { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}
