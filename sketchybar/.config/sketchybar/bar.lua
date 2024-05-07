local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  topmost = false,
  height = 37,
  position = "top",
  -- color = colors.with_alpha(colors.bar.bg, 0.9),
  color = colors.with_alpha(colors.bar.bg, 0),
  padding_right = 2,
  padding_left = 2,
  corner_radius = 10,
  margin = 17,
  y_offset = 5,
  -- border_width = 2,
  -- border_color = colors.bar.border
})
