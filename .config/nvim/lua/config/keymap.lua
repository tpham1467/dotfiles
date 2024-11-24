vim.g.mapleader = " "

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- save document
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("i", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("v", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })


-- Split navigation and management
vim.keymap.set('n', '<leader>bb', ':bprev<CR>', { desc = 'Goto Previous Buffer', silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Goto Next Buffer', silent = true })
vim.keymap.set('n', '<C-left>', ':bprev<CR>', { desc = 'Goto Previous Buffer', silent = true })
vim.keymap.set('n', '<C-right>', ':bnext<CR>', { desc = 'Goto Next Buffer', silent = true })

vim.keymap.set('n', '<leader>bd', ':bprev<CR>:bdelete #<CR>', { desc = 'Close Current Buffer' })
vim.keymap.set('n', '<leader>bD', "<cmd>:%bd<CR>", { desc = 'Close All Buffers' })
vim.keymap.set('n', '<leader>bC', "<cmd>%bd|e#|bd#<CR>", { desc = 'Close All Buffers But This' })
vim.keymap.set('n', '<leader>br', "<cmd>:e!<CR>", { desc = 'Reload Buffer' })


-- Move between splits
vim.keymap.set({ 'n', }, '<C-h>', ':wincmd h<CR>', { desc = 'Goto Left Buffer', silent = true })
vim.keymap.set({ 'n', }, '<C-l>', ':wincmd l<CR>', { desc = 'Goto Right Buffer', silent = true })
vim.keymap.set({ 'n', }, '<C-j>', ':wincmd j<CR>', { desc = 'Goto Below Buffer', silent = true })
vim.keymap.set({ 'n', }, '<C-k>', ':wincmd k<CR>', { desc = 'Goto Above Buffer', silent = true })

vim.keymap.set('t', '<C-h>', '[[<Cmd>wincmd h<CR>]]', { desc = 'Goto Left Buffer', silent = true, buffer = 0 })
vim.keymap.set('t', '<C-l>', '[[<Cmd>wincmd l<CR>]]', { desc = 'Goto Right Buffer', silent = true, buffer = 0 })
vim.keymap.set('t', '<C-j>', '[[<Cmd>wincmd j<CR>]]', { desc = 'Goto Below Buffer', silent = true, buffer = 0 })
vim.keymap.set('t', '<C-k>', '[[<Cmd>wincmd k<CR>]]', { desc = 'Goto Above Buffer', silent = true, buffer = 0 })

-- Reise splits
-- vim.keymap.set({ 'n', 't' }, '<S-Left>', ':vertical-resize +1<CR>', { silent = true })
-- vim.keymap.set({ 'n', 't' }, '<S-Right>', ':vertical-resize -1<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<S-Left>', ':vertical res +1^M<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<S-Right>', ':vertical res -1^M<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-Up>', ':resize -1<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-Down>', ':resize +1<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<S-l>', '10zl', { desc = "Scroll To The Right", silent = true })
vim.keymap.set({ 'n' }, '<S-h>', '10zh', { desc = "Scroll To The Left", silent = true })


local utils = require("utils")
local get_icon = utils.get_icon
local is_available = utils.is_available
local maps = require("utils").get_mappings_template()

-- icons displayed on which-key.nvim ---------------------------------------
local icons = {
  f = { desc = get_icon("Find", true) .. " Find" },
  p = { desc = get_icon("Packages", true) .. " Packages" },
  l = { desc = get_icon("LSP", true) .. " LSP" },
  u = { desc = get_icon("UI", true) .. " UI" },
  b = { desc = get_icon("Buffer", true) .. " Buffers" },
  bs = { desc = get_icon("Sort", true) .. " Sort Buffers" },
  c = { desc = get_icon("Run", true) .. " Compiler" },
  d = { desc = get_icon("Debugger", true) .. " Debugger" },
  tt = { desc = get_icon("Test", true) .. " Test" },
  dc = { desc = get_icon("Docs", true) .. " Docs" },
  g = { desc = get_icon("Git", true) .. " Git" },
  S = { desc = get_icon("Session", true) .. " Session" },
  t = { desc = get_icon("Terminal", true) .. " Terminal" },
}

-- dap.nvim [debugger] -----------------------------------------------------
-- Depending your terminal some F keys may not work. To fix it:
-- modified function keys found with `showkey -a` in the terminal to get key code
-- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
if is_available("nvim-dap") then
	maps.n["<leader>d"] = icons.d
	maps.x["<leader>d"] = icons.d

	-- F keys
	maps.n["<F5>"] = {
		function()
			require("dap").continue()
		end,
		desc = "Debugger: Start"
	}
	maps.n["<S-F5>"] =
	{ function() require("dap").terminate() end, desc = "Debugger: Stop" }
	maps.n["<C-F5>"] = {
		function() require("dap").restart_frame() end, desc = "Debugger: Restart" }
	maps.n["<F9>"] = {
		function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" }
	maps.n["<S-F9>"] = {
		function()
			vim.ui.input({ prompt = "Condition: " }, function(condition)
				if condition then require("dap").set_breakpoint(condition) end
			end)
		end,
		desc = "Debugger: Conditional Breakpoint",
	}
	maps.n["<F10>"] =
	{ function() require("dap").step_over() end, desc = "Debugger: Step Over" }
	maps.n["<S-F10>"] =
	{ function() require("dap").step_back() end, desc = "Debugger: Step Back" }
	maps.n["<F11>"] =
	{ function() require("dap").step_into() end, desc = "Debugger: Step Into" }
	maps.n["<S-F11>"] =
	{ function() require("dap").step_out() end, desc = "Debugger: Step Out" }

	-- Space + d
	maps.n["<leader>db"] = {
		function() require("dap").toggle_breakpoint() end,
		desc = "Breakpoint (F9)",
	}
	maps.n["<leader>dB"] = {
		function() require("dap").clear_breakpoints() end,
		desc = "Clear Breakpoints",
	}
	maps.n["<leader>dc"] =
	{ function() require("dap").continue() end, desc = "Start/Continue (F5)" }
	maps.n["<leader>dC"] = {
		function()
			vim.ui.input({ prompt = "Condition: " }, function(condition)
				if condition then require("dap").set_breakpoint(condition) end
			end)
		end,
		desc = "Conditional Breakpoint (S-F9)",
	}
	maps.n["<leader>do"] =
	{ function() require("dap").step_over() end, desc = "Step Over (F10)" }
	maps.n["<leader>do"] =
	{ function() require("dap").step_back() end, desc = "Step Back (S-F10)" }
	maps.n["<leader>db"] =
	{ function() require("dap").step_into() end, desc = "Step Into (F11)" }
	maps.n["<leader>dO"] =
	{ function() require("dap").step_out() end, desc = "Step Out (S-F11)" }
	maps.n["<leader>dq"] =
	{ function() require("dap").close() end, desc = "Close Session" }
	maps.n["<leader>dQ"] = {
		function() require("dap").terminate() end,
		desc = "Terminate Session (S-F5)",
	}
	maps.n["<leader>dp"] =
	{ function() require("dap").pause() end, desc = "Pause" }
	maps.n["<leader>dr"] =
	{ function() require("dap").restart_frame() end, desc = "Restart (C-F5)" }
	maps.n["<leader>dR"] =
	{ function() require("dap").repl.toggle() end, desc = "REPL" }
	maps.n["<leader>ds"] =
	{ function() require("dap").run_to_cursor() end, desc = "Run To Cursor" }

	if is_available("nvim-dap-ui") then
		maps.n["<leader>dE"] = {
			function()
				vim.ui.input({ prompt = "Expression: " }, function(expr)
					if expr then require("dapui").eval(expr, { enter = true }) end
				end)
			end,
			desc = "Evaluate Input",
		}
		maps.x["<leader>dE"] =
		{ function() require("dapui").eval() end, desc = "Evaluate Input" }
		maps.n["<leader>du"] =
		{ function() require("dapui").toggle() end, desc = "Debugger UI" }
		maps.n["<leader>dh"] = {
			function() require("dap.ui.widgets").hover() end,
			desc = "Debugger Hover",
		}
	end
end

utils.set_mappings(maps)

