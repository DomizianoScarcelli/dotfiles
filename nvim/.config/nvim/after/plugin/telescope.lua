local telescope = require("telescope")
local builtin = require('telescope.builtin')
telescope.setup {
    defaults = {
        file_ignore_patterns = {".git/", "node_modules"},
    },
    pickers = {
        find_files = {
            hidden=true,
        },
        git_files= {
            hidden=true
        },
        live_grep = {
            hidden = true
        }
    }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({search= vim.fn.input("Grep > ")})
-- end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})


vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})


