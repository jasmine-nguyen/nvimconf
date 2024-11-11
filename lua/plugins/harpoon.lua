return {
	"ThePrimeagen/harpoon",
	enabled = false,
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup({})
		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():add()
		end, { desc = "add new item to harpoon", noremap = true })

		-- Navigate to harpoon items
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():select(1)
		end, { desc = "harpoon 1st item", noremap = true })
		vim.keymap.set("n", "<leader>hs", function()
			harpoon:list():select(2)
		end, { desc = "harpoon 2nd item", noremap = true })
		vim.keymap.set("n", "<leader>hd", function()
			harpoon:list():select(3)
		end, { desc = "harpoon 3rd item", noremap = true })
		vim.keymap.set("n", "<leader>hf", function()
			harpoon:list():select(4)
		end, { desc = "harpoon 4th item", noremap = true })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "toggle next buffer in harpoon list", noremap = true })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "toggle previous buffer in harpoon list", noremap = true })

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>hl", function()
			toggle_telescope(harpoon:list())
		end, { desc = "open harpoon list in telescope", noremap = true })
	end,
}
