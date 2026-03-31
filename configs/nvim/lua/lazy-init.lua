-- Install lazy.nvim if it is not in the expected location in 'lazypath'
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


-- Automatically import everything in the lua/plugins folder and disable the RTP optimization which breaks on debian
require("lazy").setup({
  spec = {
    -- This imports everything in lua/plugins/*.lua
    { import = "plugins" },
  },
  performance = { rtp = { reset = false } },
})
