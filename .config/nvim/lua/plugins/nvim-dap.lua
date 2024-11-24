return {
	{
		"mfussenegger/nvim-dap",
		enabled = vim.fn.has "win32" == 0,
		event = "User BaseFile",
		config = function()
			local dap = require("dap")

			-- C#
			dap.adapters.coreclr = {
				type = 'executable',
				command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
				args = { '--interpreter=vscode' }
			}
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function() -- Ask the user what executable wants to debug
						return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net8.0', 'file')
					end,
				},
			}

			dap.adapters.python = {
				type = 'executable',
				command = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python',
				args = { '-m', 'debugpy.adapter' },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}", -- This configuration will launch the current file if used.
				},
			}
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"rcarriga/cmp-dap",
			"jay-babu/mason-nvim-dap.nvim",
			"jbyuki/one-small-step-for-vimkind",
			"nvim-java/nvim-java",
		},
	},
	-- nvim-dap-ui [dap ui]
	-- https://github.com/mfussenegger/nvim-dap-ui
	-- user interface for the debugger dap
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		opts = { floating = { border = "rounded" } },
		config = function(_, opts)
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function(
			)
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function(
			)
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			dapui.setup(opts)
		end,
	},
	-- cmp-dap [dap autocomplete]
	-- https://github.com/mfussenegger/cmp-dap
	-- Enables autocomplete for the debugger dap.
	{
		"rcarriga/cmp-dap",
		dependencies = { "nvim-cmp" },
		config = function()
			require("cmp").setup.filetype(
				{ "dap-repl", "dapui_watches", "dapui_hover" },
				{
					sources = {
						{ name = "dap" },
					},
				}
			)
		end,
	},
}
