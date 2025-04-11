return {
  "lervag/vimtex",
  config = function()
    -- Set PDF viewer to Zathura
    vim.g.vimtex_view_method = "zathura"

    -- Use latexmk for compilation
    vim.g.vimtex_compiler_method = "latexmk"

    -- Configure latexmk options for compilation
    vim.g.vimtex_compiler_latexmk = {
      build_method = "latexmk",
      options = {
        "-pdf", -- Generate PDF output
        "-interaction=nonstopmode", -- Prevent halting on errors
        "-synctex=1", -- Enable SyncTeX for PDF synchronization
      },
    }

    -- Configure the program name for Neovim's external programs (nvr is for Neovim)
    vim.g.vimtex_compiler_progname = "nvr"

    -- Enable the use of VimTeX's fast compilation mode
    vim.g.vimtex_quickfix_mode = 0 -- Disable VimTeX's automatic quickfix window

    -- Auto-sync the PDF to the source file (optional, useful for Zathura and SyncTeX)
    vim.g.vimtex_pdf_sync = 1
  end,
}
