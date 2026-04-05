-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cy", function()
  -- 获取相对于当前工作目录的文件路径
  local filepath = vim.fn.expand("%:.")
  -- 获取当前光标所在的行号
  local line_number = vim.fn.line(".")

  -- 组合格式 (如 src/main.go:42)
  local result = filepath .. ":" .. line_number

  -- 复制到系统的 "+" 寄存器（即系统剪贴板）
  vim.fn.setreg("+", result)

  -- 底部给出一个小提示，告诉你复制成功了
  vim.notify("Copied: " .. result, vim.log.levels.INFO, { title = "Clipboard" })
end, { desc = "Copy Filepath:Line to clipboard" })
