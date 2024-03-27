local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

-- To get the SOC temperature, the command is 
-- /Applications/Stats.app/Contents/Resources/smc list -t | grep "Tp2a" | awk '{print $2}'

--While the average (it seems wrong) is:
-- /Applications/Stats.app/Contents/Resources/smc list -t | grep "Tp.a" | awk '{sum += $2; count++} END {print sum/count}'

local temp = sbar.add("graph", "widgets.temp" , 42, {
  position = "right",
  graph = { color = colors.blue },
  background = {
    height = 22,
    color = { alpha = 0 },
    border_color = { alpha = 0 },
    drawing = true,
  },
--   icon = { string = icons.cpu },
  label = {
    string = "temp ??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 9.0,
    },
    align = "right",
    padding_right = 0,
    width = 0,
    y_offset = 4
  },
  padding_right = settings.paddings + 6
})

local cpu = sbar.add("graph", "widgets.cpu" , 42, {
  position = "right",
  graph = { color = colors.blue },
   background = {
    height = 22,
    color = { alpha = 0 },
    border_color = { alpha = 0 },
    drawing = true,
  },
  icon = { string = icons.cpu },
  label = {
    string = "cpu ??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 9.0,
    },
    align = "right",
    padding_right = 0,
    width = 0,
    y_offset = 4
  },
  padding_right = -6
})


local function updateTemperature()
  local temperature = 0.
  sbar.exec("/Applications/Stats.app/Contents/Resources/smc list -t | grep 'Tp2a' | awk '{print $2}'", function(output)
    temperature = math.floor(tonumber(output))
    temp:push({ temperature / 130. })
    
    local color = colors.blue
    if temperature > 30 then
        if temperature < 60 then
            color = colors.yellow
        elseif temperature < 80 then
            color = colors.orange
        else
            color = colors.red
        end
    end
    
    temp:set({
        graph = { color = color },
        label = "temp " .. temperature .. "°",
    })
  end)
end


cpu:subscribe("cpu_update", function(env)
--   -- Also available: env.user_load, env.sys_load
  local load = tonumber(env.total_load)
  cpu:push({ load / 100. })

  local color = colors.blue
  if load > 30 then
    if load < 60 then
      color = colors.yellow
    elseif load < 80 then
      color = colors.orange
    else
      color = colors.red
    end
  end

  cpu:set({
    graph = { color = color },
    label = "cpu " .. env.total_load .. "%",
  })
  updateTemperature()
end)

cpu:subscribe("mouse.clicked", function(env)
  sbar.exec("open -a 'Activity Monitor'")
end)

-- Background around the cpu item
sbar.add("bracket", "widgets.cpu.bracket", { cpu.name, temp.name }, {
  background = { color = colors.bg1 }
})

-- Background around the cpu item
sbar.add("item", "widgets.cpu.padding", {
  position = "right",
  width = settings.group_paddings
})
