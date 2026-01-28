local vim = vim

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 10
vim.opt.autocomplete = true

vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/ThePrimeagen/harpoon' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/folke/tokyonight.nvim' },
	{ src = 'https://github.com/kdheepak/lazygit.nvim' }
}

vim.cmd("colorscheme tokyonight")
vim.cmd("highlight Normal ctermbg=none guibg=none")
vim.cmd("highlight SignColumn ctermbg=none guibg=none")
vim.cmd("highlight LineNr ctermbg=none guibg=none")

vim.lsp.config['lua_ls'] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
}

vim.lsp.config['ts_ls'] = {
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
}

vim.lsp.config['denols'] = {
	cmd = { 'deno', 'lsp' },
	filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	root_markers = { 'deno.json', 'deno.jsonc' },
	settings = {
		deno = {
			enable = true,
			suggest = {
				imports = {
					hosts = { 
						["https://deno.land"] = true,
						["https://esm.sh"] = true,
						["https://jsr.io"] = true 
					}
				}
			}
		}
	}
}

vim.lsp.config['html'] = {
	cmd = { 'vscode-html-language-server', '--stdio' },
	filetypes = { 'html', 'htmldjango' },
}

vim.lsp.config['gopls'] = {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork' },
}

vim.lsp.config['arduino'] = {
	cmd = { 'arduino-language-server' },
	filetypes = { 'arduino' },
	root_markers = { '.vscode', '*.ino' },
}

vim.lsp.enable({ 'lua_ls', 'ts_ls', 'denols', 'html', 'gopls', 'arduino' })
vim.opt.completeopt = 'menu,menuone,noinsert'
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.lsp.completion.enable(true, args.data.client_id, args.buf, {autotrigger = true})
  end,
})

-- Configure hover window appearance
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = 'rounded',
    max_width = 80,
    max_height = 20,
    focusable = false,
  }
)

require('harpoon').setup()
require('lualine').setup({
	options = {
		theme = 'horizon'
	}
})
require('nvim-treesitter').setup({
	ensure_installed = { "javascript", "typescript", "javascriptreact", "typescriptreact", "lua", "arduino" },
	highlight = {
		enable = true
	}
})

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':update<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>s', ':source<CR>')

vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('n', '<leader>a', require("harpoon.mark").add_file)
vim.keymap.set('n', '<leader>x', require("harpoon.ui").toggle_quick_menu)

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>g', ':LazyGit<CR>')
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {desc = 'LSP hover documentation'})

vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')

vim.keymap.set('i', '<A-j>', '<C-n>')
vim.keymap.set('i', '<A-k>', '<C-p>')
vim.keymap.set('i', '<A-i>', '<C-y>')
vim.keymap.set('i', '<A-Space>', vim.lsp.completion.get, {desc = 'LSP completion'})
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, {desc = 'LSP signature help'})

-- Auto-trigger signature help on '(' character
vim.api.nvim_create_autocmd('InsertCharPre', {
  callback = function()
    if vim.v.char == '(' and vim.lsp.get_active_clients({bufnr = 0})[1] then
      vim.defer_fn(function()
        vim.lsp.buf.signature_help()
      end, 50)
    end
  end,
})

vim.keymap.set('i', 'jj', '<Esc>')
