return {
  "nvim-mini/mini.files",
  lazy = false,
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (directory of current file)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(LazyVim.root(), true)
      end,
      desc = "Open mini.files (root)",
    },
    {
      "<leader>fm",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
  opts = {
    -- to map moving up and down directories to arrow keys instead of 'h' and 'l'.
    -- want to find out how to have both arrow keys and 'h, l' active at the same time.
    -- mappings = {
    --   go_in = "<Right>",
    --   go_out = "<Left>",
    -- },
    windows = {
      width_nofocus = 20,
      width_focus = 30,
      width_preview = 100,
    },
    options = {
      use_as_default_explorer = true,
    },
  },
}
