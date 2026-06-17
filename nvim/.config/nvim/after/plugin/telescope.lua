local telescope = require("telescope")
local builtin = require('telescope.builtin')
local themes = require("telescope.themes")
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local actions_set = require("telescope.actions.set")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local utils = require("telescope.utils")
local from_entry = require("telescope.from_entry")
local make_entry = require("telescope.make_entry")
local metascope = require("metascope")

telescope.setup {
    defaults = {
        cache_picker = { num_pickers = 30 },
        file_ignore_patterns = { ".git/", "node_modules" },
        mappings = {
            n = {
                ["cd"] = function(prompt_bufnr)
                    local selection = require("telescope.actions.state").get_selected_entry()
                    local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                    require("telescope.actions").close(prompt_bufnr)
                    vim.cmd(string.format("Oil %s", dir))
                end
            },
        }
    },
    pickers = {
        find_files = { hidden = true },
        git_files = { hidden = true },
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

local cdPicker = function(name, cmd)
    pickers.new({}, {
        prompt_title = name,
        finder = finders.new_table { results = utils.get_os_command_output(cmd), entry_maker = make_entry.gen_from_file({}) },
        previewer = previewers.vim_buffer_cat.new({}),
        sorter = sorters.get_fuzzy_file({}),
        attach_mappings = function(prompt_bufnr)
            actions_set.select:replace(function(_, _)
                local entry = actions_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local dir = from_entry.path(entry)
                vim.cmd('Oil ' .. dir)
            end)
            return true
        end,
    }):find()
end

-- =========================================
-- CUSTOM METASCOPE KEYMAPS
-- =========================================

vim.keymap.set('n', '<leader>fo', function()
    metascope.history_picker()
end, { desc = "All Telescope History" })

vim.keymap.set('n', '<leader>ff', function()
    metascope.hybrid()
end, { desc = "All Telescope History" })

vim.keymap.set('n', '<leader>fg', function()
    metascope.hybrid_grep()
end, { desc = "All Telescope History" })

-- Find Files with history integration
-- vim.keymap.set('n', '<leader>ff', function()
--     builtin.find_files({
--         prompt_title = "Find Files",
--         attach_mappings = metascope.make_attach_save_prompt("files"),
--         hidden = true,
--     })
-- end, { desc = "Find files (Defaults to last file search)" })

-- Live Grep with history integration
-- vim.keymap.set('n', '<leader>fg', function()
--     builtin.live_grep({
--         prompt_title = "Live Grep",
--         attach_mappings = metascope.make_attach_save_prompt("grep"),
--         vimgrep_arguments = {
--             'rg',
--             '--color=never',
--             '--no-heading',
--             '--with-filename',
--             '--line-number',
--             '--column',
--             '--smart-case',
--         }
--     })
-- end, { desc = "Live grep (Defaults to last grep)" })


vim.keymap.set('n', '<leader>lf', builtin.resume, {})
vim.keymap.set('n', '<leader>fp', builtin.pickers, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fG', function() builtin.live_grep() end, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader><space><space>', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(
        themes.get_dropdown {
            windblend = 10,
            previewer = true,
        })
end, {})

vim.keymap.set('n', '<leader>fw', function()
    builtin.lsp_dynamic_workspace_symbols({
        symbols = { "function", "method" }
    })
end, { desc = 'Find functions in workspace' })

vim.keymap.set('n', '<leader>fF', function()
    builtin.live_grep({
        prompt_title = "Regex Function Search (No LSP)",
        default_text = "\\b(function|func|fn|def)\\s+\\w+"
    })
end, { desc = 'Grep for function definitions' })
