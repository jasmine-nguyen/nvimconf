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

		vim.keymap.set("n", "<leader>db", dap.set_breakpoint, { desc = "set [b]reakpoint", noremap = true })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[c]ontinue", noremap = true })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "step [i]nto", noremap = true })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "run [l]ast", noremap = true })
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "step [o]ut", noremap = true })
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[t]oggle breakpoint", noremap = true })
		vim.keymap.set("n", "<leader>dv", dap.step_over, { desc = "step o[v]er", noremap = true })

		-- Go DAP config
		require("dap-go").setup()
	end,
}
