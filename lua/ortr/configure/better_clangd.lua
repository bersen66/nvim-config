require("clangd_extensions").setup({
    server = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
        },
        init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
        },
    },
    extensions = {
        autoSetHints = true,
        inlay_hints = {
            inline = vim.fn.has("nvim-0.10") == 1,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            highlight = "Comment",
        },
        -- НАСТРОЙКИ ДЛЯ ВЫРАВНИВАНИЯ
        symbol_info = {
            border = "rounded", -- Скруглённые углы окна смотрятся лучше
        },
        memory_usage = {
            border = "rounded",
        },
    },
})

-- Показать детальный Layout структуры (размер, alignment, padding)
vim.keymap.set("n", "<leader>cl", vim.lsp.buf.hover, { desc = "Clangd: View Hover & Memory Layout" })

-- Показать иерархию типов 
vim.keymap.set("n", "<leader>ch", "<cmd>vert rightbelow ClangdTypeHierarchy<CR>", { desc = "Clangd: Show Type Hierarchy (Right)" })
