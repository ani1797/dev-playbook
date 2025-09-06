return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        path_display = { "smart" },
      },
    })
    -- Optional: Keymaps for common Telescope pickers
    local keymap = vim.keymap.set
    keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
  end,
}
