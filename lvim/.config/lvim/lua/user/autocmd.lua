vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "toggleterm" },
  callback = function(ev)
    vim.print(vim.inspect(ev))
    vim.o.spell = false
    print("filetype autocmd")
  end
})

