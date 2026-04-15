require "ortr.options"
require "ortr.plugins"


vim.g.mapleader = ' '

require "ortr.configure.instant"
-- require "ortr.configure.rosepine"
require "ortr.configure.lsp"
require "ortr.configure.telescope"
require "ortr.configure.harpoon"
require "ortr.configure.dropbar"
require "ortr.configure.nvimtree"
require "ortr.configure.toggleterm"
require "ortr.configure.trailing"
require "ortr.configure.trouble"
require "ortr.configure.todo_comments"
require "ortr.configure.context"
require "ortr.configure.better_clangd"

-- require  "ortr.configure.cursorline"
vim.ui.select = require('dropbar.utils.menu').select
vim.cmd('colorscheme retrobox')


-- Перенос слишком длинных строк
vim.opt.wrap = true         -- Включить перенос
vim.opt.breakindent = true  -- Сохранять отступы при переносе
vim.opt.linebreak = true    -- Не рвать слова
vim.opt.showbreak = "↳ "    -- Символ в начале перенесенной строки

-- Перемещение по визуальным строкам
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
