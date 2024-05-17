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
Plug ('junegunn/fzf.vim')
Plug ('preservim/nerdtree')
Plug('williamboman/mason.nvim')
Plug ('williamboman/mason-lspconfig.nvim')
Plug ('neovim/nvim-lspconfig')
Plug ('williamboman/nvim-lsp-installer')
Plug ('famiu/feline.nvim')
Plug ('nvim-tree/nvim-web-devicons')
Plug ('willothy/nvim-cokeline')
Plug ('voldikss/vim-floaterm')
Plug ('folke/tokyonight.nvim')
Plug ('tadmccorkle/markdown.nvim')
Plug ('nvim-treesitter/nvim-treesitter')
Plug ('nvim-lua/plenary.nvim')
vim.call('plug#end')


-- LSP configurations--------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup {
    --ensure_installed = { "lua_ls", "rust_analyzer", "svlangserver", "verible"},
    ensure_installed = { "lua_ls", "rust_analyzer", "verible", "clangd", "pylsp"},
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

require("lspconfig").pylsp.setup {
	on_attach = on_attach
}

--require("lspconfig").svlangserver.setup {
--	  on_init = function(client)
--    local path = client.workspace_folders[1].name
--      client.config.settings.systemverilog = {
--        includeIndexing     = {"**/*.{sv,svh}"},
--        excludeIndexing     = {"test/**/*.sv*"},
--        defines             = {},
--        launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
--        formatCommand       = "/tools/verible-verilog-format"
--			}
--				    client.notify("workspace/didChangeConfiguration")
--    return true
--  end
--}
require("lspconfig").verible.setup {
	on_attach = on_attach
}

require("lspconfig").clangd.setup {
	on_attach = on_attach
}
-----------------------------------------------------------------
vim.o.termguicolors = true
require('nvim-treesitter').setup()
require('markdown').setup()
require("tokyonight").setup()
require('feline').setup()
require("cokeline.history").setup()

vim.cmd[[colorscheme tokyonight-moon]]



-----------------------------------------------------------------


vim.wo.number = true
vim.wo.relativenumber = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true

-- Configuration example
vim.api.nvim_set_keymap('n' ,'<F7>',   ':FloatermNew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t' ,'<F7>',   '<C-\\><C-n>:FloatermNew<CR>',{ noremap = true, silent = true } )
vim.api.nvim_set_keymap('n' ,'<F8>',   ':FloatermPrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t' ,'<F8>',   '<C-\\><C-n>:FloatermPrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n' ,'<F9>',   ':FloatermNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t' ,'<F9>',   '<C-\\><C-n>:FloatermNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n' ,'<F12>',  ':FloatermToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t' ,'<F12>',  '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true })

--vim.g.maplocalleader = "\\"


-- Split vertically
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

-- Open file explorer (assuming you have a file explorer plugin like NERDTree or nvim-tree.lua)
vim.api.nvim_set_keymap('n', '<leader>e', ':E<CR>', { noremap = true, silent = true })

-- Open FZF (fuzzy finder)
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', { noremap = true, silent = true })

-- Open NERDTREE
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Source the init.lua file
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- Open new tab
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })
-- Next tab
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })
-- Prev tab
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true })
-- Change Current working directory
vim.api.nvim_set_keymap('n', '<leader>cd', 'cd %:h<CR>', { noremap = true, silent = true })
-- copy current path to clipboard
--vim.api.nvim_set_keymap('n', 'cp', ':let @+=expand('%')<CR>', { noremap = true, silent = true })
