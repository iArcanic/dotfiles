return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency for Telescope to work
    "nvim-telescope/telescope-fzf-native.nvim", -- Optional: for faster fuzzy finding (make sure to install fzf)
    "nvim-telescope/telescope-media-files.nvim", -- Optional: to preview images and other media files
  },
  config = function()
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        prompt_prefix = " ", -- The prompt indicator, you can change this to whatever you prefer
        selection_caret = " ", -- The indicator for selected items
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules", ".git/" }, -- Ignore specific files and directories
        mappings = {
          i = {
            ["<C-h>"] = actions.which_key, -- Show which-key in insert mode (helpful for keybindings)
            ["<C-n>"] = actions.move_selection_next, -- Move to the next result in insert mode
            ["<C-p>"] = actions.move_selection_previous, -- Move to the previous result in insert mode
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- Enable fuzzy matching
          override_generic_sorter = false, -- Use default sorter for general items
          override_file_sorter = true, -- Use fzf for file sorting
        },
        media_files = {
          filetypes = { "png", "jpg", "jpeg", "gif", "bmp" }, -- Define filetypes for media preview
        },
      },
    })

    -- Load the fzf extension (if installed)
    pcall(require("telescope").load_extension, "fzf")

    -- Example key mappings to use Telescope
    vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })
  end,
}
