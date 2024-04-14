local telescope = require("telescope")
local builtin = require('telescope.builtin')
telescope.setup {
    pickers = {
        find_files = {
            hidden=true
        }
    }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search= vim.fn.input("Grep > ")})
end)
