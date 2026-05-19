local Flash = require("flash")

local function format(opts)
    -- always show first and second label
    return {
        { opts.match.label1, "FlashMatch" },
        { opts.match.label2, "FlashLabel" },
    }
end

-- 1. Wrap the logic in a reusable function
local function two_char_jump()
    Flash.jump({
        search = { mode = "search" },
        label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
        pattern = [[\<]],
        action = function(match, state)
            state:hide()
            Flash.jump({
                search = { max_length = 0 },
                highlight = { matches = false },
                label = { format = format },
                matcher = function(win)
                    -- limit matches to the current label
                    return vim.tbl_filter(function(m)
                        return m.label == match.label and m.win == win
                    end, state.results)
                end,
                labeler = function(matches)
                    for _, m in ipairs(matches) do
                        m.label = m.label2 -- use the second label
                    end
                end,
            })
        end,
        labeler = function(matches, state)
            local labels = state:labels()
            for m, match in ipairs(matches) do
                match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                match.label2 = labels[(m - 1) % #labels + 1]
                match.label = match.label1
            end
        end,
    })
end

-- Keymaps
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set('o', 'r', function() require("flash").remote() end, { desc = "Remote Flash" })
vim.keymap.set({ 'o', 'n', 'x' }, '<leader>R', function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set('c', '<C-s>', function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

-- 2. Map your new leader motion here
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>j', two_char_jump, { desc = "Flash 2-Char Jump" })
