-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {

  group = vim.api.nvim_create_augroup("AutoReloadOnExternalChange", { clear = true }),

  callback = function()

    if vim.fn.mode() ~= "c" then

      vim.cmd("silent! checktime")

    end

  end,

})

vim.api.nvim_create_autocmd("FileChangedShellPost", {

  group = vim.api.nvim_create_augroup("NotifyOnExternalChange", { clear = true }),

  callback = function()

    vim.notify("文件已被外部修改，已自动重新加载", vim.log.levels.INFO)

  end,

})
