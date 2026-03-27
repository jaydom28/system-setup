-- -- Add the local site path to the runtimepath so Neovim can find installed parsers
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/site")

-- Default vim experience settings
vim.opt.syntax = "on"                       -- syntax highlighting
vim.opt.autoindent = true                   -- Use the same indent level as the current line when starting a newline
vim.opt.cursorline = true                   -- enable cursorline
vim.opt.completeopt = "menuone,noinsert"
vim.opt.expandtab = true                    -- Insert space in place of tabs
vim.opt.smartcase = true                    -- When searching for a term, ignore the casing
vim.opt.incsearch = true                    -- Highlight matches in real time when searching
vim.opt.mouse = "a"                         -- Enable mouse usage in vim
vim.opt.compatible = false
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 16
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.visualbell = true
vim.opt.wildmenu = true

vim.cmd.colorscheme("habamax")

-- Netrw settings (the built-in file browser for vim)
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3


-- Set leader key and load plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Set some variables for the vimrc
local PATH_CONFIG = vim.fn.stdpath("config")
local PATH_VIMRC = PATH_CONFIG .. "/init.lua"

-- Keybindings
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap("n", "<leader>h", ":bp<CR>", opts)
keymap("n", "<leader>l", ":bn<CR>", opts)
keymap("n", "<leader>f", ":Lexplore . <bar> vertical res 20<CR>", opts)
keymap("n", "<leader>v", ":edit $MYVIMRC<CR>", opts)
keymap("n", "<leader>s", ":luafile $MYVIMRC | echo 'Reloaded vimrc'<CR>", opts)
keymap("n", "<leader>b", ":TagbarOpen 'jfc'<CR>", opts)

require("lazy-init")
