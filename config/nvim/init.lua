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

vim.lsp.enable({ 'lua_ls', 'ts_ls','html', 'gopls' })
require('harpoon').setup()
require('lualine').setup({
	options = {
		theme = 'horizon'
	}
})
require('nvim-treesitter').setup({
	ensure_installed = { "javascript", "typescript", "lua" },
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

vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')

vim.keymap.set('i', '<A-j>', '<C-n>')
vim.keymap.set('i', '<A-k>', '<C-p>')
vim.keymap.set('i', '<A-i>', '<C-y>')

vim.keymap.set('i', 'jj', '<Esc>')
