return {
  "hrsh7th/nvim-cmp", -- Completion engine
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP completions
    "hrsh7th/cmp-buffer", -- Buffer words
    "hrsh7th/cmp-path", -- File system paths
    "hrsh7th/cmp-cmdline", -- Command-line completions
    "L3MON4D3/LuaSnip", -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet completions
    "rafamadriz/friendly-snippets", -- Collection of snippets
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load VSCode-style snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expand snippets
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Next suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Prev suggestion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
        ["<Esc>"] = cmp.mapping.close(), -- Close completion menu
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP-based suggestions
        { name = "luasnip" }, -- Snippet completions
        { name = "buffer" }, -- Buffer words
        { name = "path" }, -- File system paths
      }),
    })

    -- Command-line completion (e.g., `:`)
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    })

    -- Search `/` completion
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })
  end,
}
