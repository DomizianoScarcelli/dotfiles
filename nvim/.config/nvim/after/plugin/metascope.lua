local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local actions_set = require("telescope.actions.set")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers") -- NEW: Required for the custom previewer

local M = {}

-- ==========================================
-- CONFIGURATION
-- ==========================================
local type_config = {
    grep = {
        icon = "󰊄 ",
        label = "Grep",
        builtin = "live_grep",
        opts = {
            vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' }
        }
    },
    files = {
        icon = "󰈔 ",
        label = "File",
        builtin = "find_files",
        opts = { hidden = true }
    },
    buffers = {
        icon = "󰈙 ",
        label = "Buff",
        builtin = "buffers",
        opts = {}
    },
    default = {
        icon = " ",
        label = "Misc",
        builtin = "find_files",
        opts = {}
    }
}

-- ==========================================
-- CORE LOGIC (JSON State Management)
-- ==========================================
local history_file = vim.fn.stdpath("data") .. "/telescope_custom_history.json"
local max_history = 100
local telescope_history = {}

local function load_history()
    if vim.fn.filereadable(history_file) == 1 then
        local data = vim.fn.readfile(history_file)
        if data and data[1] then
            local ok, decoded = pcall(vim.fn.json_decode, data[1])
            if ok and type(decoded) == "table" then
                telescope_history = decoded
            end
        end
    end
end

local function save_history()
    while #telescope_history > max_history do
        table.remove(telescope_history)
    end

    local ok, encoded = pcall(vim.fn.json_encode, telescope_history)
    if ok then
        vim.fn.writefile({ encoded }, history_file)
    end
end

load_history()

function M.get_last_search(search_type)
    for _, entry in ipairs(telescope_history) do
        if entry.type == search_type then return entry.prompt end
    end
    return ""
end

function M.make_attach_save_prompt(search_type)
    return function(prompt_bufnr, map)
        local function save_prompt_and_select()
            local prompt = actions_state.get_current_line()
            if prompt and prompt ~= "" then
                -- Deduplicate
                for i, entry in ipairs(telescope_history) do
                    if entry.prompt == prompt and entry.type == search_type then
                        table.remove(telescope_history, i)
                        break
                    end
                end
                -- Insert at the top
                table.insert(telescope_history, 1, {
                    prompt = prompt,
                    type = search_type,
                    timestamp = os.date("%m/%d %H:%M")
                })
                save_history()
            end
            actions.select_default(prompt_bufnr)
        end
        map("i", "<CR>", save_prompt_and_select)
        map("n", "<CR>", save_prompt_and_select)
        return true
    end
end

-- ==========================================
-- CUSTOM PREVIEWER LOGIC
-- ==========================================
-- This translates a history entry into a live terminal command
local function get_preview_command(entry_value)
    if not entry_value.prompt or entry_value.prompt == "" then
        return { 'echo', 'Empty prompt' }
    end

    if entry_value.type == "grep" then
        -- Grab the args you defined in type_config, but force color to ALWAYS so it looks good in the previewer
        local config = type_config.grep
        local cmd = vim.deepcopy(config.opts.vimgrep_arguments)
        for i, v in ipairs(cmd) do
            if v == "--color=never" then cmd[i] = "--color=always" end
        end
        table.insert(cmd, entry_value.prompt)
        return cmd
    elseif entry_value.type == "files" then
        -- Use `fd` if available, otherwise fallback to `rg --files`
        if vim.fn.executable("fd") == 1 then
            return { 'fd', '--type', 'f', '--hidden', '--color=always', entry_value.prompt }
        else
            return { 'rg', '--files', '--hidden', '--color=always', '-g', '*' .. entry_value.prompt .. '*' }
        end
    end

    return { 'echo', 'Preview not configured for type: ' .. entry_value.type }
end

local history_previewer = previewers.new_termopen_previewer({
    get_command = function(entry, _)
        -- 'entry.value' contains our actual Lua table containing the prompt and type
        return get_preview_command(entry.value)
    end,
    title = "Live Results Preview"
})


-- ==========================================
-- THE UI PICKER
-- ==========================================
function M.history_picker(opts)
    opts = opts or {}
    local filter_types = opts.types

    local results = {}
    if not filter_types then
        results = telescope_history
    else
        for _, entry in ipairs(telescope_history) do
            if type(filter_types) == "string" and entry.type == filter_types then
                table.insert(results, entry)
            elseif type(filter_types) == "table" and vim.tbl_contains(filter_types, entry.type) then
                table.insert(results, entry)
            end
        end
    end

    if #results == 0 then
        print("No search history found!")
        return
    end

    pickers.new(opts, {
        prompt_title = "Telescope History (Atuin Style)",

        layout_config = {
            horizontal = {
                mirror = false,
                preview_width = 0.55,
            }
        },

        -- Attach our custom executing previewer
        previewer = history_previewer,

        finder = finders.new_table({
            results = results,
            entry_maker = function(entry)
                local config = type_config[entry.type] or type_config.default
                local time_str = entry.timestamp and ("[" .. entry.timestamp .. "] ") or ""
                local display_str = string.format("%s%s[%s] %s", time_str, config.icon, config.label, entry.prompt)

                return {
                    value = entry,
                    display = display_str,
                    ordinal = display_str,
                }
            end
        }),
        sorter = sorters.get_generic_fuzzy_sorter({}),
        attach_mappings = function(prompt_bufnr)
            actions_set.select:replace(function(_, _)
                local selection = actions_state.get_selected_entry()
                actions.close(prompt_bufnr)

                if selection then
                    vim.defer_fn(function()
                        local entry = selection.value
                        local config = type_config[entry.type] or type_config.default
                        local builtin_fn = require('telescope.builtin')[config.builtin]

                        if builtin_fn then
                            local resume_opts = vim.deepcopy(config.opts)
                            resume_opts.prompt_title = config.label .. " (Resumed)"
                            resume_opts.default_text = entry.prompt
                            resume_opts.attach_mappings = M.make_attach_save_prompt(entry.type)

                            builtin_fn(resume_opts)
                        end
                    end, 50)
                end
            end)
            return true
        end,
    }):find()
end

return M
