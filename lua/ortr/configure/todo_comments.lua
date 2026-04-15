-- Поиск всех TODO, FIXME, BUG и т.д. по всему проекту
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs" })
