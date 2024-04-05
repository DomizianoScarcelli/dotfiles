local settings = require("settings")
local colors = require("colors")

-- Date item
local date = sbar.add("item", {
  icon = {
    color = colors.yellow,
    padding_right = 1,
    drawing = "off",
    font = {
      size = 12.0,
    },
  },
  label = {
    padding_left = 0,
    padding_right = 4,
    font = { family = settings.font.text, 
    style = settings.font.style_map["Bold"]
    ,size = 12.0 },
  },
  position = "right",
  update_freq = 60,
  width = 0,
  y_offset = 7,
})

date:subscribe({ "forced", "routine", "system_woke", "mouse.entered", "mouse.exited", "mouse.exited.global" }, function(env)
  date:set({ label = os.date("%a, %b %d") })
end)

-- date:subscribe("mouse.clicked", function(env)
--   sbar.exec("open -a Calendar.app")
-- end)

-- Clock item
local clock = sbar.add("item", {
  icon = {
    drawing = "off",
  },
  label = {
    padding_right = 4,
    font = { family = settings.font.numbers, size = 12.0},
  },
  padding_left = 10,
  position = "right",
  update_freq = 5,
  y_offset = -5,
  popup = { align = "right" },
})

clock:subscribe({ "forced", "routine", "system_woke", "mouse.entered", "mouse.exited", "mouse.exited.global" }, function(env)
  clock:set({ label = os.date("%I:%M %p") })
end)

-- clock:subscribe("mouse.clicked", function(env)
--   sbar.exec("open -a Calendar.app")
-- end)

-- local calendar = sbar.add("bracket", {
--   date.name,
--   clock.name,
-- }, {background = { color = colors.bg1 }})