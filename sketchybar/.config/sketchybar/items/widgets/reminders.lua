
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
})

local reminders_bracket = sbar.add("bracket", "widgets.reminders.bracket", {
  reminders.name
}, {
  background = { color = colors.bg1 },
})

reminders_bracket:subscribe("mouse.entered", function(env)
  sbar.animate("tanh", 30, function()
    reminders_bracket:set({
      background = {
        color = colors.grey
      },
      border = {
        color = colors.bg1
      }
    })
    reminders:set({
      icon = {
        color = colors.bg1
      }
    })
  end)
end)


reminders_bracket:subscribe("mouse.exited", function(env)
  sbar.animate("tanh", 30, function()
    reminders_bracket:set({
      background = {
        color = colors.bg1
      },
      border = {
        color = colors.bg2
      }
    })
    reminders:set({
      icon = {
        color = colors.white
      }
    })
  end)
end)




local function toggle_reminders_menubar()
    sbar.exec('osascript -e \'tell application "System Events" to key code 15 using {option down, command down}\'')
end

reminders:subscribe("mouse.clicked", toggle_reminders_menubar)