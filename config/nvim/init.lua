local vim = vim

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 10
vim.opt.autocomplete = true
vim.opt.clipboard = 'unnamedplus'

vim.filetype.add({
	extension = {
		gsc = 'gsc',
	},
})

vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

	{ src = 'https://github.com/folke/tokyonight.nvim' },
	{ src = 'https://github.com/Mofiqul/vscode.nvim' },
	{ src = 'https://github.com/olimorris/onedarkpro.nvim' },

	{ src = 'https://github.com/kdheepak/lazygit.nvim' },
	{ src = 'https://github.com/ThePrimeagen/harpoon' },
	{ src = 'https://github.com/dmtrKovalenko/fff.nvim' },
	{ src = 'https://github.com/akinsho/toggleterm.nvim' },
	{ src = 'https://github.com/folke/noice.nvim' },

	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },

	{ src = 'https://github.com/MunifTanjim/nui.nvim' },
	{ src = 'https://github.com/rcarriga/nvim-notify' },
	{ src = 'https://github.com/j-morano/buffer_manager.nvim' },
}

vim.cmd.packadd('nvim-treesitter')

vim.cmd("colorscheme onedark")
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

vim.lsp.config['gsclsp'] = {
	cmd = { 'gsclsp' },
	filetypes = { 'gsc' },
	single_file_support = true,
}

vim.lsp.config['gopls'] = {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod' },

	settings = {
		gopls = {
			hints          = {
				-- Enable the kinds of hints you want (all are very useful in Go)
				assignVariableTypes    = true, --   x := 42      →   x := 42 /* int */
				compositeLiteralFields = true, --   Struct{...}  →   Struct{Field: ...}
				compositeLiteralTypes  = true,
				constantValues         = true,
				functionTypeParameters = true,
				parameterNames         = true, --   Foo(      )  →   Foo(name string)
				rangeVariableTypes     = true, --   for k, v  →   for k string, v int
			},

			-- Optional: other nice gopls settings
			semanticTokens = true,
			staticcheck    = true,
			gofumpt        = true, -- if you like gofumpt-style formatting
		},
	},
}

vim.diagnostic.config({ virtual_text = true })

vim.lsp.enable({ 'lua_ls', 'ts_ls', 'denols', 'html', 'gopls', 'gsclsp' })
vim.opt.completeopt = 'menu,menuone,noinsert'
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
		vim.lsp.inlay_hint.enable()
	end,
})

require('harpoon').setup()
require('lualine').setup({
	options = {
		theme = 'horizon'
	}
})

require("toggleterm").setup()
require("noice").setup({
	lsp = {
		hover = {
			silent = true,
		}
	}
})
require("ibl").setup()
require("buffer_manager").setup()

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'lua', 'go' },
	callback = function()
		vim.treesitter.start()
	end,
})

-- fff
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(event)
		if event.data.updated then
			require('fff.download').download_or_build_binary()
		end
	end,
})

vim.g.fff = {
	lazy_sync = true,
	debug = {
		enabled = true,
		show_scores = true,
	},
}

vim.keymap.set('n', 'ff', function() require('fff').find_files() end, { desc = 'FFFind files' })

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':update<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>s', ':source<CR>')

vim.keymap.set('n', '<leader>e', ':Explore<CR>')

-- Harpoon is broken right now
--vim.keymap.set('n', '<leader>a', require("harpoon.mark").add_file)
--vim.keymap.set('n', '<leader>x', require("harpoon.ui").toggle_quick_menu)
-- Buffer manager as harpoon replacement for now
vim.keymap.set('n', '<leader>x', function() require("buffer_manager.ui").toggle_quick_menu() end)

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>g', ':LazyGit<CR>')

vim.keymap.set('n', '<leader>t', ':ToggleTerm direction=float<CR>')

vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')

vim.keymap.set('i', '<A-j>', '<C-n>')
vim.keymap.set('i', '<A-k>', '<C-p>')
vim.keymap.set('i', '<A-i>', '<C-y>')
vim.keymap.set('i', '<A-Space>', vim.lsp.completion.get, { desc = 'LSP completion' })
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { desc = 'LSP signature help' })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)


vim.keymap.set('n', '<leader>ih', function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = 'Toggle Inlay Hints' })

vim.keymap.set('i', 'jj', '<Esc>')

-- For debugging gsclsp
vim.highlight.priorities.semantic_tokens = 75 -- Default treesitter is 100
