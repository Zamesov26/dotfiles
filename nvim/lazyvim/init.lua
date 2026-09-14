-- bootstrap lazy.nvim, LazyVim and your plugins
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    -- Если nvim запущен с конкретным файлом/аргументом,
    -- сессию не восстанавливаем.
    if vim.fn.argc() > 0 then
      return
    end

    vim.schedule(function()
      require("lazy").load({ plugins = { "persistence.nvim" } })
      require("persistence").load()
    end)
  end,
})

require("config.lazy")
