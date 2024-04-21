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

telescope.setup {
    defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
        path_display = { "shorten" },
        mappings = {
            n = {
                ["cd"] = function(prompt_bufnr)
                    local selection = require("telescope.actions.state").get_selected_entry()
                    local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                    require("telescope.actions").close(prompt_bufnr)
                    -- Depending on what you want put `cd`, `lcd`, `tcd`
                    vim.cmd(string.format("Oil %s", dir))
                end
            },
        }

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

function Cd(path)
    local iCloud = "/Users/dov/Library/Mobile\\ Documents/com~apple~CloudDocs/dovsync "
    local Desktop = "/Users/dov/Desktop "
    local Downloads = "/Users/dov/Downloads "
    cdPicker('Cd',
        { vim.o.shell, '-c', "fd . " ..
        iCloud .. Desktop .. Downloads .. "--exclude node_modules --type directory 2>/dev/null" })
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fz',
    "<CMD>:lua require('telescope').extensions.z.z { cmd = { '/Users/dov/.config/z.lua/z.lua', '-l' } }<cr>", {})
vim.keymap.set('n', '<leader>fd', Cd, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
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
