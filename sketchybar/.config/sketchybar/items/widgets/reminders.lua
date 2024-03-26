
local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local reminders = sbar.add("item", {
  position = "right",
  icon = {
    font = {
      style = settings.font.style_map["Regular"],
      size = 15.0,
    },
    string = icons.reminders.icon,
  },
  label = {drawing = false},
  update_freq = 180,
})

local reminders_bracket = sbar.add("bracket", "widgets.reminders.bracket", {
  reminders.name
}, {
  background = { color = colors.bg1 },
})



local function toggle_reminders_menubar()
    sbar.exec('osascript -e \'tell application "System Events" to key code 15 using {option down, command down}\'')
end

reminders:subscribe("mouse.clicked", toggle_reminders_menubar)