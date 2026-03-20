-- Visit the project page for the latest installation instructions
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Boilerplate for next steps.
    -- From now on, all code examples will go to this section.
    -- {
    --     "https://gitprovider.com/exampleuser/myplugin",
    -- },
    {
          "ibhagwan/fzf-lua",
          -- optional for icon support
          dependencies = { "nvim-tree/nvim-web-devicons" },
          -- or if using mini.icons/mini.nvim
          -- dependencies = { "nvim-mini/mini.icons" },
          ---@module "fzf-lua"
          ---@type fzf-lua.Config|{}
          ---@diagnostic disable: missing-fields
          opts = {}
          ---@diagnostic enable: missing-fields
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "ludovicchabant/vim-gutentags"
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
    }
})
