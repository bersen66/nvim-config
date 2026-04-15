-- Открыть/закрыть панель всех проблем проекта (LSP)
vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>",
  {desc = "Diagnostics (Trouble)"})

-- Проблемы только в текущем файле
vim.keymap.set("n", "<leader>tb", "<cmd>Trouble diagnostics in current file<cr>",
  {desc = "Buffer Diagnostics (Trouble)"})

-- Список Symbols (аналог того, что мы обсуждали в Telescope, но сбоку)
vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=true<cr>",
  {desc = "Symbols (Trouble)"})


-- Включает сообщения об ошибках прямо в коде
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Символ перед текстом ошибки
    spacing = 4,   -- Отступ от конца кода до текста ошибки
  },
  -- Остальные важные настройки:
  signs = true,       -- Иконки в колонке слева (у тебя они есть)
  underline = true,   -- Подчеркивание ошибок
  update_in_insert = false, -- Не обновлять текст ошибки пока ты печатаешь (чтобы не мелькало)
  severity_sort = true,     -- Сортировать: сначала критические ошибки, потом ворнинги
})
