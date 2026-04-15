local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })



vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():remove() end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>nm", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>nn", function() harpoon:list():next() end)

-- Посмотреть все метки проекта
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Search Marks" })

-- Открыть jumplist
vim.keymap.set("n", "<leader>jl", "<cmd>Telescope jumplist<cr>", { desc = "Open Jumplist" })

-- Прыгнуть к объявлению
vim.keymap.set("n", "<leader>jd", vim.lsp.buf.definition, { desc = "Jump to defenition" })

-- Прыгнуть обратно
vim.keymap.set("n", "<leader>jb", "<C-o>", { desc = "Jump Backwards (Previous position)" })

-- Прыгнуть вперед
vim.keymap.set("n", "<leader>jf", "<C-i>", { desc = "Jump Forward (Next position)" })

-- Открыть keymaps
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Search Keymaps" })

-- git-status search
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git: status" })

--git stash search
vim.keymap.set("n", "<leader>gp", "<cmd>Telescope git_stash<cr>", { desc = "Git: stash" })

--git branch search
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git: branches" })

vim.lsp.inlay_hint.enable(true)
