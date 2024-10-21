-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- persistence - select a session to load
vim.keymap.set("n", "<leader>qS", function()
  require("persistence").select()
end, { noremap = true, silent = true, desc = "Select a session to load" })
