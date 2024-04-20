local telescope = require("telescope")
local builtin = require('telescope.builtin')
local themes = require("telescope.themes")
telescope.setup {
    defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        git_files = {
            hidden = true
        },
        live_grep = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                "-u",
                "-u",
            }
        },
    }
}

telescope.load_extension("dir")

vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({search= vim.fn.input("Grep > ")})
-- end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fu', builtin.buffers, {})


vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(
        themes.get_dropdown {
            windblend = 10,
            previewer = true,
        })
end, {})
