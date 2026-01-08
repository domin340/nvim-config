return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
	},
	config = function()
		local dap = require 'dap'

		local dapui = require 'dapui'
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

		local map_key = vim.keymap.set
		map_key('n', '<leader>ot', dap.toggle_breakpoint, { desc = 'DAP toggles break point in this line' })
		map_key('n', '<leader>oc', dap.continue, { desc = 'DAP start debugging / go next break point ' })

		-- configurations
		require 'configs.debuggers'
	end,
}
