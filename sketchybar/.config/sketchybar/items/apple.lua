local colors = require("colors")
local icons = require("icons")

-- Padding item required because of bracket
-- sbar.add("item", { width = 5 })

local apple = sbar.add("item", {
  icon = {
    font = { size = 15.0 },
    string = icons.apple,
    padding_right = 8,
    padding_left = 8,
    color = colors.magenta
  },
  label = { drawing = false },
  background = {
    color = colors.bg2,
    -- border_color = colors.black,
    -- border_width = 0
  },
  padding_left = 1,
  padding_right = 1,
  click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0"
})

-- Double border for apple using a single item bracket
sbar.add("bracket", { apple.name }, {
  background = {
    color = colors.transparent,
    height = 25,
    -- border_color = colors.grey,
  }
})

-- Padding item required because of bracket
sbar.add("item", { width = 7 })
