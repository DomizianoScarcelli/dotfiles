-- require("oil").setup({
--     columns = {
--         "icon",
--         "size",
--     },
--     buf_options = {
--         buflisted = true,
--         bufhidden = "hide",
--     },
--     delete_to_trash = true,
--     use_default_keymaps = false,
--     view_options = {
--         show_hidden = true
--     },
--     float = {
--         -- Padding around the floating window
--         padding = 4,
--         max_width = 0,
--         max_height = 0,
--     },
--     keymaps = {
--         ["g?"] = "actions.show_help",
--         ["<CR>"] = "actions.select",
--         -- ["<C-s>"] = "actions.select_vsplit",
--         -- ["<C-h>"] = "actions.select_split",
--         -- ["<C-t>"] = "actions.select_tab",
--         ["<ESC>"] = "actions.close",
--         ["<C-p>"] = "actions.preview",
--         -- ["<C-c>"] = "actions.close",
--         ["<C-l>"] = "actions.refresh",
--         ["-"] = "actions.parent",
--         ["_"] = "actions.open_cwd",
--         ["`"] = "actions.cd",
--         ["~"] = "actions.tcd",
--         ["gs"] = "actions.change_sort",
--         ["gx"] = "actions.open_external",
--         ["g."] = "actions.toggle_hidden",
--         ["g\\"] = "actions.toggle_trash",
--         ["gp"] = require('image_preview').PreviewImageOil()
--     },
-- })
