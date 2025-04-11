return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim", -- LSP package manager
    "williamboman/mason-lspconfig.nvim", -- Bridges Mason & LSP
  },
  config = function()
    -- Load Mason
    require("mason").setup()

    -- Auto-install LSP servers
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- JSON
        "jsonls",
        "spectral",

        -- Lua
        "lua_ls",

        -- CSS
        "ast_grep",
        "css_variables",
        "cssls",
        "cssmodules_ls",
        "tailwindcss",
        "unocss",

        -- Docker
        "docker_compose_language_service",
        "dockerls",

        -- HTML
        "html",
        "lwc_ls",
        "stimulus_ls",
        "superhtml",
        "templ",
        "twiggy_language_server",

        -- JavaScript
        "biome",
        "denols",
        "eslint",
        "glint",
        "harper_ls",
        "quick_lint_js",
        "rome",
        "ts_ls",
        "vtsls",

        -- LaTeX
        "ltex",
        "texlab",
        "textlsp",

        -- Markdown
        "grammarly",
        "markdown_oxide",
        "marksman",
        "prosemd_lsp",
        "remark_ls",
        "vale_ls",
        "zk",

        -- Python
        "basedpyright",
        "jedi_language_server",
        "mutt_ls",
        "pylsp",
        "pylyzer",
        "pyre",
        "pyright",
        "ruff",
        "sourcery",

        -- YAML
        "gitlab_ci_ls",
        "hydra_lsp",
        "yamlls",

        -- Zsh
        "bashls",

        -- Other
        "autotools_ls",
        "custom_elements_ls",
        "dprint",
        "efm",
        "typos_lsp",
      },

      -- Install LSPs on demand
      automatic_installation = true,
    })

    -- Setup LSP servers
    local lspconfig = require("lspconfig")

    -- Default setup for most LSPs
    local servers = {
      "jsonls",
      "eslint",
      "cssls",
      "html",
      "bashls",
      "dockerls",
      "yamlls",
      "marksman",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({})
    end

    -- Lua (for Neovim)
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }, -- Fix undefined global 'vim'
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    -- Python
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic", -- Can be "strict"
            autoImportCompletions = true,
            diagnosticSeverityOverrides = { reportMissingImports = "warning" },
          },
        },
      },
    })

    -- LaTeX
    lspconfig.texlab.setup({
      settings = {
        texlab = {
          auxDirectory = "build", -- Directory for auxiliary files
          bibtexFormatter = "textlab", -- Use texlab's BibTeX formatter
          forwardSearch = {
            executable = "zathura", -- PDF viewer
            args = { "--synctex-forward", "%l:1:%f", "%p" }, -- SyncTEX setup
          },
          latex = {
            build = {}, -- Disable auto-build
          },
        },
      },
    })

    -- Tailwind CSS
    lspconfig.tailwindcss.setup({
      filetypes = { "html", "css", "javascript", "typescript", "svelte" },
    })

    -- YAML
    lspconfig.yamlls.setup({
      settings = {
        yaml = {
          keyOrdering = false,
        },
      },
    })
  end,
}
