return {
    "ludovicchabant/vim-gutentags",
    config = function()

    vim.g.gutentags_project_root = { ".git" }
    vim.g.gutentags_add_default_project_roots = 0
    vim.g.gutentags_generate_on_new = 1
    vim.g.gutentags_generate_on_missing = 1
    vim.g.gutentags_generate_on_write = 1
    vim.g.gutentags_generate_on_empty_buffer = 1
    vim.g.gutentags_ctags_extra_args = { "--tag-relative=yes", "--fields=+ailmnS" }

    -- Set up cache
    vim.g.gutentags_cache_dir = vim.env.HOME .. "/.cache/nvim/gutentags"
    if not vim.loop.fs_stat(vim.g.gutentags_cache_dir) then
        os.execute("mkdir -p " .. vim.g.gutentags_cache_dir)
    end

    vim.g.gutentags_ctags_exclude = {
      "*.git", "*.svg", "*.hg", "*/tests/*", ".mypy_cache", "build", "dist",
      "bin", "node_modules", "cache", "docs", "*.md", "*-lock.json", "*.lock",
      "*.html", "*.json", "*.min.*", "*.map", "*.bak", "*.zip", "*.pyc",
      "*.swp", "*.swo", "*.bmp", "*.gif", "*.ico", "*.jpg", "*.png",
      "*.pdf", "*.doc", "*.docx", "*.ppt", "*.pptx",
    }
    end,
}
