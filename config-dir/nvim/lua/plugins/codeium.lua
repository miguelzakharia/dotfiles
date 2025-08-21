return {
  "Exafunction/codeium.nvim",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "AvanteInput",
      callback = function()
        vim.b.codeium_enabled = false
      end,
    })
  end,
}
