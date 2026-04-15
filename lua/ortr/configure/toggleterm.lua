require("toggleterm").setup{
    size=30,
    open_mapping="<leader>ttt",
    autochdir = false,
    close_on_exit = true,
    auto_scroll = true,
    direction = "horizontal"
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  -- Нажал Esc — перешел в нормальный режим (удобно, чтобы копировать текст в терминале)
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

  -- Быстрые переходы между окнами прямо из терминала
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- Применять эти настройки только при открытии терминала
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
