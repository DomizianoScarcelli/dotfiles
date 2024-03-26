return {
  black = 0xff181926,
  white = 0xffcdd6f4,
  red = 0xffcba6f7,
  green = 0xffa6e3a1,
  blue = 0xff8aadf4,
  yellow = 0xffa6e3a1,
  orange = 0xfffab387,
  magenta = 0xffcba6f7,
  grey = 0xff939ab7,
  transparent = 0x00000000,

  bar = {
    bg = 0xff181926,
    border = 0xff2c2e34,
  },
  popup = {
    bg = 0xff181926,
    border = 0xff7f8490
  },
  bg1 = 0xff313244,
  bg2 = 0xff45475a,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
