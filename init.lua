local vim = vim
-- Set the mapleader to a space
vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"


local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Use 'dir' option to install plugin in a non-default directory
Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })

-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })

-- Post-update hook can be a lambda expression
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

Plug('williamboman/mason.nvim')
Plug ('williamboman/mason-lspconfig.nvim')
Plug ('neovim/nvim-lspconfig')
Plug ('williamboman/nvim-lsp-installer')

vim.call('plug#end')


require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
}


local on_attatch = function(_,_)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.defination, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.implementation, {})
end

require("lspconfig").rust_analyzer.setup {
	on_attach = on_attach
}
require("lspconfig").lua_ls.setup {
	on_attach = on_attach
}


vim.wo.number = true
vim.wo.relativenumber = true

vim.o.smartindent = true


-- Split vertically
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

-- Open file explorer (assuming you have a file explorer plugin like NERDTree or nvim-tree.lua)
vim.api.nvim_set_keymap('n', '<leader>e', ':E<CR>', { noremap = true, silent = true })

-- Open FZF (fuzzy finder)
vim.api.nvim_set_keymap('n', '<leader>f', ':FZF<CR>', { noremap = true, silent = true })

-- Source the init.lua file
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<CR>', { noremap = true, silent = true })



















