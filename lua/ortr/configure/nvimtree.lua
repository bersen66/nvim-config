require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
    filters = {
        dotfiles = false,
    },
    diagnostics = {
        enable = true,
    },
    git = {
        enable = true,

    }
})

