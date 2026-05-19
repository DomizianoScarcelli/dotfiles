require("bufferline").setup {
    options = {
        numbers = "buffer_id",
        -- separator_style = "slant",
        indicator = {
            style = 'icon', -- 'underline', 'icon', or 'none'
        },
        show_buffer_close_icons = false, -- Hides the 'x' on each tab
        show_close_icon = false,         -- Hides the global 'x' in the corner

        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true
            }
        }
    },

    highlights = require("catppuccin.special.bufferline").get_theme()
}

-- Move the current buffer tab left or right
vim.keymap.set("n", "<leader>L", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>H", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })

-- Cycle through buffers based on their visual order in bufferline
vim.keymap.set("n", "H", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer tab" })
vim.keymap.set("n", "L", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer tab" })

-- Delete buffers to the left or right
vim.keymap.set("n", "<leader>dr", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })
vim.keymap.set("n", "<leader>dl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })

-- Bufferline's safer version of your "Delete other buffers" (<leader>do)

vim.keymap.set("n", "<leader>do", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close all OTHER buffers" })

-- Pick a buffer by letter to jump to it instantly
vim.keymap.set("n", "<leader><space>", "<Cmd>BufferLinePick<CR>", { desc = "Pick a buffer to jump to" })
-- Toggle a pin on the current buffer
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin on buffer" })

-- Delete all buffers EXCEPT the pinned ones
vim.keymap.set("n", "<leader>dB", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Close all non-pinned buffers" })
vim.keymap.set("n", "<leader>db", "<CMD>bdelete<cr>")
