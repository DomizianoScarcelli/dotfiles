local settings = require("settings")
local colors = require("colors")

local front_app = sbar.add("item", "front_app", {
  display = "active",
  icon = { drawing = false },
  label = {
    font = {
      style = settings.font.style_map["Black"],
      size = 12.0,
    },
    color = colors.bar.border,
  },
  position="center",
  updates = true,
})

front_app:subscribe("front_app_switched", function(env)
  front_app:set({ label = { string = env.INFO } })
end)

-- front_app:subscribe("mouse.clicked", function(env)
--   sbar.trigger("swap_menus_and_spaces")
-- end)
