local db = require("dashboard")
local version = vim.version()

local header = {
"    ⠀⠀⠀⠀⠀⠀⠀           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"    ⠀⠀⠀⠀⠀⠀⠀           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"    ⠀⠀⠀⠀⠀⠻⣿⣽⣒⡖⡦⡤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⢿⣾⣾⣼⣮⣳⣢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠛⠛⠻⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣗⡶⡤⣤⣀⣀⣀⡀⣀⢀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⢇⡨⠿⠤⠤⢴⣧⢄⣀⡀⠀⢀⣤⣾⠿⠛⠻⣿⣿⣿⣶⣷⣷⣷⣷⣷⣿⡿⠟",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠚⠉⠀⠸⡔⠡⢡⡵⠋⠙⢦⡂⠍⠳⡿⡋⠁⠀⠀⠀⠀⠉⠙⠛⠛⠛⠉⠉⠉⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⡇⢅⠏⠀⠀⠀⠀⠉⡕⡁⡂⡊⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠁⠀⠀⡀⠀⢠⢃⡝⠀⠀⠀⠀⠀⠀⡇⡂⡊⠤⠭⢇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣸⠀⠀⠀⣷⢀⡎⡂⡇⠀⠀⢰⣵⠀⢰⢑⠐⢌⣌⣊⠔⢙⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⡒⡋⢅⢺⡀⠀⠀⣠⠎⡂⠢⡇⠀⠀⠈⠋⢀⡞⡠⢑⠡⡊⠔⡡⠡⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⢀⢔⢑⢐⢐⠌⡐⡑⡛⡓⡋⠅⡂⡊⢌⢱⡀⠀⠀⢀⢜⢐⠄⠅⢬⠣⠡⢂⡵⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⣤⣔⢗⡖⣖⢵⢴⢬⢔⣐⢌⠐⠌⡂⡂⡊⡐⡐⠽⣖⣚⢑⢐⠔⠨⡨⡣⠡⠡⡙⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀ ⣠⠔⡒⣻⣿⣿⡷⡷⣷⣵⡵⡽⡸⡹⣓⢧⢆⢂⢊⢐⠌⡰⢐⢐⢐⢡⡨⡚⠡⢂⠅⡑⡐⠜⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀ ⡼⠔⡑⡐⢄⠻⣿⣿⣿⣾⣦⣧⣷⣽⣼⣮⣾⣾⢃⠢⢂⠌⠔⣰⠴⠓⠍⠢⠨⡈⠢⠨⡐⡈⠢⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠱⡅⠢⠑⠄⢅⢙⢿⣿⣿⣿⣿⣿⣿⣿⡿⢟⠡⢂⠅⡃⠅⢅⣊⣎⠨⡨⠊⢌⠐⢅⢑⠐⠌⠌⢌⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠈⠙⠚⠚⠊⠉⠁⠈⠻⠿⠿⠿⠻⣍⠂⠅⢌⠣⢂⠚⢌⢐⡼⢐⠡⠡⢑⢐⠡⡁⠢⠡⠡⡑⠩⡛⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠚⠦⠮⡤⠵⡒⠫⠨⡐⠌⠌⡂⠢⠡⠨⠨⡨⠨⡐⢡⣶⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡱⡁⡢⠡⡑⠄⢅⠑⠌⠌⢌⠊⠌⠄⠕⠨⢸⣿⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⡂⠢⡁⡢⢱⢁⢊⢎⠌⡂⠅⠅⠕⠡⠡⠡⡩⢹⠀⡠⠂⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢐⠌⢌⠐⢼⡌⡐⣰⢸⢐⠌⠌⢌⠊⢌⠊⠌⠄⢽⠩⠨⡩⠃⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢐⠌⡐⡙⡍⣕⢴⡚⠼⡐⠌⠌⡂⡑⠄⠅⠕⠡⡿⠜⠑⢅⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢐⠌⡐⡐⡓⡑⡐⠧⠫⠡⠡⡑⡐⠌⠌⢌⠊⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡔⠨⡐⡐⡐⠔⠨⠨⠨⠊⢌⠐⠄⠅⠕⡐⡱⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⣅⢂⢂⢊⠌⢌⠊⠌⢌⠂⢅⠑⡅⣑⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢹⠉⠒⠢⠮⢤⣡⣡⣁⣪⠰⢵⢱⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢆⡃⣆⡲⠀⠀⠀⠀⠀⠀⠀⢠⠸⡐⣢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠧⠇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⣄⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"    ⠀⠀⠀⠀⠀⠀⠀           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}


local center = {
    {
        desc = "Find File                     ",
        keymap = "",
        key = "f",
        icon = "  ",
        action = "Telescope find_files",
    },
    {
        desc = "Recents",
        keymap = "",
        key = "r",
        icon = "  ",
        action = "Telescope oldfiles",
    },

    --TODO: this causes an error
    -- {
    --     desc = "Browse Files",
    --     keymap = "",
    --     key = "b",
    --     icon = "  ",
    --     action = "Oil",
    -- },


    -- {
    --     desc = "Load Last Session",
    --     keymap = "",
    --     key = "L",
    --     icon = "  ",
    --     action = "SessionLoad",
    -- },

    -- {
    --     desc = "Update Plugins",
    --     keymap = "",
    --     key = "u",
    --     icon = "  ",
    --     action = "Lazy update",
    -- },

    {
        desc = "Manage Extensions",
        keymap = "",
        key = "e",
        icon = "  ",
        action = "Mason",
    },

    {
        desc = "Config",
        keymap = "",
        key = "c",
        icon = "  ",
        action = "Telescope find_files cwd=~/.dotfiles/nvim/.config/nvim",
    },
    {
        desc = "Exit",
        keymap = "",
        key = "q",
        icon = "  ",
        action = "exit",
    },
}

-- HYPER setup
db.setup({
    theme = 'doom',
    config = {
        header = header,
        center = center
    },
    footer = {},
})

-- TODO: this causes an error
--
-- -- -- Opens nvim dashboard when the last buffer is closed, instead of opening an empty buffer
-- vim.defer_fn(
--     function()
--         vim.api.nvim_create_autocmd(
--             'BufDelete',
--             {
--                 group    = vim.api.nvim_create_augroup('open-dashboard-after-last-buffer-close', { clear = true }),
--                 callback = function(event)
--                     for buf = 1, vim.fn.bufnr('$') do
--                         if buf ~= event.buf and vim.fn.buflisted(buf) == 1 then
--                             if vim.api.nvim_buf_get_name(buf) ~= '' and vim.bo[buf].filetype ~= 'dashboard' then
--                                 return
--                             end
--                         end
--                     end
--                     vim.cmd('Dashboard')
--                 end,
--             }
--         )
--     end,
--     0
-- )
