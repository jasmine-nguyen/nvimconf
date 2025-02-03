return {
	"echasnovski/mini.indentscope",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("mini.indentscope").setup({
			symbol = "┋",
		})
	end,
}
