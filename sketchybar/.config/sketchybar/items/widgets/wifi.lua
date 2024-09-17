local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "network_update"
-- for the network interface "en0", which is fired every 2.0 seconds.
sbar.exec("killall network_load >/dev/null; $CONFIG_DIR/helpers/event_providers/network_load/bin/network_load en0 network_update 2.0")

local popup_width = 250

local vpn_status = sbar.add("item", {
    position = "right",
    icon = {
        string = icons.wifi.closed_lock,
        color = colors.red,
    },
    label = {
        string = "VPN",
        color = colors.white,
    },
    width = 55,
})

-- Background around the item
local wifi = sbar.add("item", "widgets.wifi.padding", {
  position = "right",
  label = { drawing = false },
})

local wifi_bracket = sbar.add("bracket", "widgets.wifi.bracket", {
  wifi.name, vpn_status.name
}, {
  background = { color = colors.bg1 },
  popup = { align = "center", height = 30}
})

local ssid = sbar.add("item", {
  position = "popup." .. wifi_bracket.name,
  icon = {
    font = {
      style = settings.font.style_map["Bold"]
    },
    string = icons.wifi.router,
  },
  width = popup_width,
  align = "center",
  label = {
    font = {
      size = 15,
      style = settings.font.style_map["Bold"]
    },
    max_chars = 18,
    string = "????????????",
  },
  background = {
    height = 2,
    color = colors.grey,
    y_offset = -15
  }
})

local ip = sbar.add("item", {
  position = "popup." .. wifi_bracket.name,
  icon = {
    align = "left",
    string = "IP:",
    width = popup_width / 2,
  },
  label = {
    string = "???.???.???.???",
    width = popup_width / 2,
    align = "right",
  }
})

local vpn_location = sbar.add("item", {
  position = "popup." .. wifi_bracket.name,
  icon = {
    align = "left",
    string = "VPN Location:",
    width = popup_width / 2,
  },
  label = {
    string = "VPN Not Connected",
    width = popup_width / 2,
    align = "right",
  }
})

sbar.add("item", { position = "right", width = settings.group_paddings })

local vpn_connected = false

wifi:subscribe({"wifi_change", "system_woke", "network_update"}, function(env)
  sbar.exec("ipconfig getifaddr en0", function(ip)
    local connected = not (ip == "")
        wifi:set({
          icon = {
            string = connected and icons.wifi.connected or icons.wifi.disconnected,
            color = connected and colors.white or colors.red,
          },
        })
    end)
  sbar.exec("ifconfig", function(result)
      -- utun420: Wireguard
      -- ipsec9: IKEv2
        vpn_connected = string.find(result, "utun420") or string.find(result, "ipsec0")
        vpn_status:set({
            icon = {
                string = vpn_connected and icons.wifi.closed_lock or icons.wifi.opened_lock,
                color = vpn_connected and colors.green or colors.blue,
            },
            label = {
                color = vpn_connected and colors.green or colors.blue
            }
        })
    end)
end)


local function hide_details()
  wifi_bracket:set({ popup = { drawing = false } })
end

local function toggle_details()
  local should_draw = wifi_bracket:query().popup.drawing == "off"
  if should_draw then
    wifi_bracket:set({ popup = { drawing = true }})
    sbar.exec("curl --silent https://ipinfo.io/ip", function (result)
        ip:set({ label = result })
    end)
    if vpn_connected then
        local city = ""
        sbar.exec("curl --silent https://ipinfo.io/city", function (result)
            city = result
            vpn_location:set({ label = city })
        end)
        sbar.exec("curl --silent https://ipinfo.io/region", function (result)
            vpn_location:set({ label = city .. ", " .. result })
        end)
    end
    sbar.exec("ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'", function(result)
        ssid:set({ label = result })
    end)
  else
    hide_details()
  end
end

wifi:subscribe("mouse.clicked", toggle_details)
wifi:subscribe("mouse.exited.global", hide_details)
vpn_status:subscribe("mouse.clicked", toggle_details)
vpn_status:subscribe("mouse.exited.global", hide_details)


local function copy_label_to_clipboard(env)
  local label = sbar.query(env.NAME).label.value
  sbar.exec("echo \"" .. label .. "\" | pbcopy")
  sbar.set(env.NAME, { label = { string = icons.clipboard, align="center" } })
  sbar.delay(1, function()
    sbar.set(env.NAME, { label = { string = label, align = "right" } })
  end)
end

-- ssid:subscribe("mouse.clicked", copy_label_to_clipboard)
-- ip:subscribe("mouse.clicked", copy_label_to_clipboard)
