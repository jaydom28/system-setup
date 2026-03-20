require("config.lazy")

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


-- Netrw settings (the built-in file browser for vim)
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3


-- Set leader key and load plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Colorscheme and statusline
vim.cmd.colorscheme("habamax")
require("lualine").setup()


-- Gutentags configuration
vim.g.gutentags_add_default_project_roots = 0
vim.g.gutentags_project_root = {"package.json", ".git"}
vim.g.gutentags_generate_on_new = 1
vim.g.gutentags_generate_on_missing = 1
vim.g.gutentags_generate_on_write = 1
vim.g.gutentags_generate_on_empty_buffer = 1
vim.g.gutentags_ctags_extra_args = {"--tag-relative=yes", "--fields=+ailmnS"}
vim.g.gutentags_ctags_exclude = {
"*.git", "*.svg", "*.hg",
"*/tests/*",
".mypy_cache",
"build",
"dist",
"*sites/*/files/*",
"bin",
"node_modules",
"bower_components",
"cache",
"compiled",
"docs",
"example",
"bundle",
"vendor",
"*.md",
"*-lock.json",
"*.lock",
"*bundle*.js",
"*build*.js",
".*rc*",
"*.html", "*.json",
"*.min.*",
"*.map",
"*.bak",
"*.zip",
"*.pyc",
"*.class",
"*.sln",
"*.Master",
"*.csproj",
"*.tmp",
"*.csproj.user",
"*.cache",
"*.pdb",
"tags*",
"cscope.*",
"*.css",
"*.less",
"*.scss",
"*.exe", "*.dll",
"*.mp3", "*.ogg", "*.flac",
"*.swp", "*.swo",
"*.bmp", "*.gif", "*.ico", "*.jpg", "*.png",
"*.rar", "*.zip", "*.tar", "*.tar.gz", "*.tar.xz", "*.tar.bz2",
"*.pdf", "*.doc", "*.docx", "*.ppt", "*.pptx",
}

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


-- FZF-lua related settings
require("fzf-lua").setup({"fzf-vim"})       -- Set the fzf-lua profile to use the fzf-vim defaults
-- If currently in a git project, use git files for file search
local function file_find()
    if vim.uv.fs_stat(".git") then
        return FzfLua.git_files
    end
    return FzfLua.files
end
-- FZF related keymaps
keymap("n", "<leader>p", file_find(), opts)
keymap("n", "<leader>P", FzfLua.files, opts)
keymap("n", "<leader>t", FzfLua.btags, opts)
keymap("n", "<leader>T", FzfLua.tags, opts)
keymap("n", "<leader>o", FzfLua.grep_curbuf, opts)
keymap("n", "<leader>O", FzfLua.live_grep_native, opts)
keymap("n", "<leader>c", FzfLua.colorschemes, opts)
