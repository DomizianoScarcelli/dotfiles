local cols = {
    transparent = 0x00000000
}

local catppuccin_mocha = {
    black = 0xff181926,
    white = 0xffcdd6f4,
    red = 0xff350586,
    green = 0xff9cd399,
    blue = 0xff0068c4,
    yellow = 0xffa6e3a1,
    orange = 0xfffab387,
    magenta = 0xffcba6f7,
    grey = 0xff939ab7,
    mauve = 0xff9cd399,
    bg1 = 0xff1d1d2b,
    bg2 = 0xff1b033b,
}

local monotone = {
    black = 0xffcdd6f4,
    white = 0xffcdd6f4,
    red = 0xffcdd6f4,
    green = 0xffcdd6f4,
    blue = 0xffcdd6f4,
    yellow = 0xffcdd6f4,
    orange = 0xffcdd6f4,
    magenta = 0xffcdd6f4,
    grey = 0xffcdd6f4,
    mauve = 0xffcdd6f4,
    bg1 = cols.transparent,
    bg2 = cols.transparent
}

local gruvbox = {
    black = 0xff282828,
    white = 0xffebdbb2,
    red = 0xffcc241d,
    green = 0xff98971a,
    blue = 0xff458588,
    yellow = 0xffd79921,
    orange = 0xffd65d0e,
    magenta = 0xffb16286,
    grey = 0xffa89984,
    mauve = 0xffb16286,
    bg1 = 0xff3c3836,
    bg2 = 0xff504945,
}


local function with_alpha(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

colors = gruvbox
colors.with_alpha = with_alpha

colors.bar = {
    bg = colors.bg1,
    border = colors.black,
}
colors.popup = {
    bg = colors.bg2,
    border = colors.black,
}
colors.bar.bg = with_alpha(colors.bar.bg, 0.2)
colors.bg1 = with_alpha(colors.bg1, 0.2)
return colors
