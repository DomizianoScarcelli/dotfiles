local status_ok, ts_context = pcall(require, "treesitter-context")
if not status_ok then
    return
end

ts_context.setup({
    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = nil,          -- Separator between context and content. Should be a single character string, like '-'.
    zindex = 20,              -- The Z-index of the context window
    on_attach = nil,          -- (fun(buf: integer): boolean) return false to disable attaching
})

-- Optional: Keymap to jump to the context (e.g., jumping up to the class/function definition)
vim.keymap.set("n", "[c", function()
    ts_context.go_to_context(vim.v.count1)
end, { silent = true, desc = "Jump to treesitter context" })
