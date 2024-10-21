return {
  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    lazy = false,
    priority = 2000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = false,
        cache = true,
        borderless_telescope = { border = false, style = "flat" },
        theme = { variant = "auto" },
      })

      vim.cmd("colorscheme cyberdream")
      vim.api.nvim_set_keymap("n", "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })
      vim.api.nvim_create_autocmd("User", {
        pattern = "CyberdreamToggleMode",
        callback = function(ev)
          print("Switched to " .. ev.data .. " mode!")
        end,
      })
    end,
  },
}
