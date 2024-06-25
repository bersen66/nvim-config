require "ortr.options"
require "ortr.plugins"

vim.g.mapleader = ' '

require "ortr.configure.instant"
require "ortr.configure.rosepine"
require "ortr.configure.lsp"
require "ortr.configure.telescope"
require "ortr.configure.harpoon"
require "ortr.configure.dropbar"
require "ortr.configure.nvimtree"
vim.ui.select = require('dropbar.utils.menu').select
