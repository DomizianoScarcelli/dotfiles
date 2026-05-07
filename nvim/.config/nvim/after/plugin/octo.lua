local status_ok, octo = pcall(require, "octo")
if not status_ok then
    return
end

octo.setup({
    picker = "telescope",
    enable_builtin = true,
})

vim.keymap.set("n", "<leader>oi", "<CMD>Octo issue list<CR>", { desc = "List GitHub Issues" })
vim.keymap.set("n", "<leader>op", "<CMD>Octo pr list<CR>", { desc = "List GitHub PullRequests" })
vim.keymap.set("n", "<leader>od", "<CMD>Octo discussion list<CR>", { desc = "List GitHub Discussions" })
vim.keymap.set("n", "<leader>on", "<CMD>Octo notification list<CR>", { desc = "List GitHub Notifications" })

vim.keymap.set("n", "<leader>os", function()
    require("octo.utils").create_base_search_command({ include_current_repo = true })
end, { desc = "Search GitHub" })
