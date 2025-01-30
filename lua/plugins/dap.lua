return {
	"mfussenegger/nvim-dap",
	enabled = false,
	event = "VeryLazy",
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
		local exitDebug = function()
			dap.disconnect()
			dapui.close()
		end
		vim.keymap.set("n", "<leader>dh", dap.step_out, { desc = "debug - step out (left)", noremap = true })
		vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "debug - step over (down)", noremap = true })
		vim.keymap.set("n", "<leader>dk", dap.step_back, { desc = "debug - step back (up)", noremap = true })
		vim.keymap.set("n", "<leader>dl", dap.step_into, { desc = "debug - step into (right)", noremap = true })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "debug - toggle breakpoint", noremap = true })
		vim.keymap.set("n", "<leader>de", exitDebug, { desc = "debug - exit", noremap = true })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "debug - restart", noremap = true })
		vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "debug - start", noremap = true })

		-- Go DAP config
		local dapgo = require("dap-go")
		dapgo.setup()
		vim.keymap.set("n", "<leader>dt", dapgo.debug_test, { desc = "debug - single test", noremap = true })
		vim.keymap.set(
			"n",
			"<leader>dp",
			dapgo.debug_last_test,
			{ desc = "debug - run last (previous) test", noremap = true }
		)
	end,
}
