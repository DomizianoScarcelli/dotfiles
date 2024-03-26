local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  topmost = "window",
  height = 35,
  position = "top",
  color = colors.bar.bg,
  padding_right = 2,
  padding_left = 2,
  corner_radius = 10,
  margin = 10,
  y_offset = 5,
})
