return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- Logic-based keymap for <leader>p
    {
      "<leader>p",
      function()
        if vim.uv.fs_stat(".git") then
          require("fzf-lua").git_files()
        else
          require("fzf-lua").files()
        end
      end,
      desc = "Find Files (Git-aware)",
    },
    -- Standard keymaps
    { "<C-x><C-l>", "<cmd>FzfLua complete_line<cr>", mode="i", silent = true, desc = "FZF line-completion" },
    { "<leader>a", "<cmd>FzfLua global<cr>", desc = "Global picker" },
    { "<leader>P", "<cmd>FzfLua files<cr>", desc = "Find Files (All)" },
    { "<leader>t", "<cmd>FzfLua btags<cr>", desc = "Buffer Tags" },
    { "<leader>T", "<cmd>FzfLua tags<cr>", desc = "Project Tags" },
    { "<leader>o", "<cmd>FzfLua grep_curbuf<cr>", desc = "Grep Current Buffer" },
    { "<leader>O", "<cmd>FzfLua live_grep_native<cr>", desc = "Live Grep (Native)" },
    { "<leader>c", "<cmd>FzfLua colorschemes<cr>", desc = "Colorschemes" },
  },
  opts = {
    -- This replaces require("fzf-lua").setup({"fzf-vim"})
    "fzf-vim",
  },
}
