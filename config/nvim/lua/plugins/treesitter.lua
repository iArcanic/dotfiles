return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- Extra motions
    "nvim-treesitter/playground", -- Inspect syntax tree
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "json",
        "html",
        "css",
        "python",
        "yaml",
        "markdown",
        "bash",
        "dockerfile",
        "tsx",
        "latex",
      },
      sync_install = false, -- Install parsers asynchronously
      auto_install = true, -- Auto-install missing parsers
      ignore_install = {},
      modules = {}, -- Modules are empty for now
      highlight = { enable = true }, -- Enable syntax highlighting
      indent = { enable = true }, -- Treesitter-based indentation
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    })
  end,
}
