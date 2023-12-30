return {
  "nvim-tree/nvim-web-devicons",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        hijack_cursor = true,
        renderer = {
          icons = {
            git_placement = "signcolumn",
          },
        },
        filters = {
          custom = { "^.git$" },
        },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = { section_separators = "", component_separators = "|" },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              separator = true,
            },
          },
        },
      })
    end,
  },
}
