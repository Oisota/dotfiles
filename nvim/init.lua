-- Derek NeoVim Config

-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd("set nofixeol")
vim.cmd("set nofixendofline")

-- lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{'https://github.com/dracula/vim.git', enabled=false},
	'Mofiqul/dracula.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	{'nvim-telescope/telescope.nvim', tag='0.1.6'},
	'f-person/git-blame.nvim',
	{'lewis6991/gitsigns.nvim', tag='v0.7'},
	{'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	'https://github.com/udalov/kotlin-vim',
	'alaviss/nim.nvim',
}
require("lazy").setup(plugins)

-- color scheme
require('dracula').setup()
vim.cmd [[colorscheme dracula]]

-- configure telescope
-- remember to also install 'rg' and 'fd' commands for file search to work properly
require('telescope').setup({
	pickers = {
		find_files = {
			hidden = true
		}
	}
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fa', builtin.find_files, { desc = 'Telescope find all files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope Man Pages' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Telescope Commands' })

vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope Git Commits' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope Git Status' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope Git Branches' })

-- configure gitsigns
require('gitsigns').setup()

-- configure lualine
require('lualine').setup {
	options = {
		theme = 'dracula-nvim'
	},
	sections = {
		lualine_b = {'diff', 'diagnostics'},
		lualine_c = {
			{'filename', file_status = true, path = 1}
		}
	},
	inactive_sections = {
		lualine_c = {
			{'filename', file_status = true, path = 1}
		}
	},
	tabline = {
		lualine_a = {'tabs'},
		lualine_z = {'branch'},
	}
}

-- configure bufferline
-- this seems unnecessary given we can easily switch buffers with telescope
-- require('bufferline').setup()

-- configure indent blankline
require('ibl').setup()

-- general config
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.list = true -- show hidden chars
vim.opt.title = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.filetype = 'on'
vim.opt.foldenable = false
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- custom mappings
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>o', 'o<Esc>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>O', 'O<Esc>', { noremap=true, silent=true })

vim.api.nvim_set_keymap('n', '<leader><Tab>', ':bnext<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>q', ':bdelete<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>w', ':quit<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap=true }) -- esc exits insert mode in terminal

-- custom file types
vim.filetype.add({
	filename = {
		["Jenkinsfile"] = "groovy"
	}
})

-- Language Server Configs
-- vim.lsp.start_client({
-- 	-- Command and arguments to start the server.
-- 	name = 'pythonls',
-- 	cmd = { 'pylsp' },
-- 	-- Filetypes to automatically attach to.
-- 	filetypes = { 'python' },
-- 	root_markers = { '.git', 'pyproject.toml', 'requirements.txt', 'setup.py', 'Pipfile' },
-- 	 root_dir = vim.fs.dirname(vim.fs.find({'.git', 'pyproject.toml', 'requirements.txt', 'setup.py', 'Pipfile' }, { upward = true })[1]),
-- 	single_file_support = true,
-- 	settings = {}
-- })
