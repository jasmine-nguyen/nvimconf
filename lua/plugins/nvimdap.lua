return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>db", dap.set_breakpoint, { desc = "set breakpoint", noremap = true })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "continue", noremap = true })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "step into", noremap = true })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "run last", noremap = true })
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "step out", noremap = true })
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "toggle breakpoint", noremap = true })
		vim.keymap.set("n", "<leader>dv", dap.step_over, { desc = "step over", noremap = true })

		-- Go DAP config
		require("dap-go").setup()
	end,
}
