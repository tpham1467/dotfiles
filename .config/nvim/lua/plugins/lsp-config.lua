return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      lspconfig.harper_ls.setup({
        capabilities = capabilities
      })

      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities
      })
      
      lspconfig.biome.setup({
        capabilities = capabilities
      })

      lspconfig.texlab.setup({
        capabilities = capabilities
      })

      lspconfig.nginx_language_server.setup({
        capabilities = capabilities
      })

      lspconfig.gitlab_ci_ls.setup({
        capabilities = capabilities
      })

      lspconfig.yamlls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    end,
  },
  {
		'nvimtools/none-ls.nvim',
		-- event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		-- event = "VeryLazy",
		config = function()
			local null_ls = require('null-ls')
			null_ls.setup({
				sources = {
					-- null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.csharpier,
					null_ls.builtins.formatting.yamlfmt,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
				}
			})
			vim.keymap.set('n', '<leader>lff', function() vim.lsp.buf.format({ async = true }) end,
				{ desc = "Format document" })
			
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename Symbol" })
			
      vim.keymap.set({ 'n', 'i' }, '<f2>', vim.lsp.buf.rename, { desc = "Rename Symbol" })
			
      vim.keymap.set({ 'n', 'i' }, '<f12>', function() 
        require('omnisharp_extended').lsp_definition() end, { desc = "Go to Definition" })
			
      vim.keymap.set({ 'n' }, '<leader>ld', function()
        require('omnisharp_extended').lsp_definition() end, { desc = "Go to Definition" })
			
      vim.keymap.set('n', '<leader>li', function()
        require('omnisharp_extended').lsp_implementation() end, { desc = "Go to Implementation" })
			
      vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help, { desc = "Signature Help" })

      vim.keymap.set('n', '<leader>lsR', function() 
        require('omnisharp_extended').lsp_references() end, { desc = "To to References" })

      -- vim.keymap.set({ 'n' }, '<leader>lsD', ":Trouble document_diagnostics<CR>", { desc = "Toggle Document Diagnostics" })

      vim.keymap.set({ 'n' }, '<leader>lsD', ":Trouble diagnostics<CR>", { desc = "Toggle Document Diagnostics" })

      vim.keymap.set('n', '<leader>lsI', ':Trouble lsp_implementations<CR>',
				{ desc = "Toggle LSP References" })

      vim.keymap.set('n', '<leader>lsd', ":Trouble lsp_definitions<CR>", { desc = "Toggle LSP Definitions" })
    end
	},
  {
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		-- event = { 'VeryLazy' },
		-- enabled = false,
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
			-- "neovim/nvim-lspconfig"
		},
		config = function()
			require('mason-null-ls').setup({
				automatic_setup = true
			})
		end,
	},
  {
		'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
		event = "VeryLazy",
		config = function()
			require('lsp_lines').setup()

			vim.diagnostic.config({
				virtual_lines = false,
				virtual_text = true,
			})

			local function toggleLines()
				local new_value = not vim.diagnostic.config().virtual_lines
				vim.diagnostic.config({ virtual_lines = new_value, virtual_text = not new_value })
				return new_value
			end

			vim.keymap.set('n', '<leader>lu', toggleLines, { desc = "Toggle Underline Diagnostics", silent = true })
		end
	},
}
