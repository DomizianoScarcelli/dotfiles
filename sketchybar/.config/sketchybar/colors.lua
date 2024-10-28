local colors = {
    black = 0xff181926,
    white = 0xffcdd6f4,
    red = 0xff350586,
    green = 0xff9cd399,
    blue = 0xff0068c4,
    yellow = 0xffa6e3a1,
    orange = 0xfffab387,
    magenta = 0xffcba6f7,
    grey = 0xff939ab7,
    transparent = 0x00000000,
    mauve = 0xff9cd399,

    bar = {
        bg = 0xff1b033b,
        border = 0xff350586,
    },

    popup = {
        bg = 0xff1d1d2b,
        border = 0xff9cd399
    },

    bg1 = 0xff313244,
    bg2 = 0xff45475a,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then return color end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}

local monotone = {
    black =0xffcdd6f4,
    white =0xffcdd6f4,
    red =0xffcdd6f4,
    green =0xffcdd6f4,
    blue =0xffcdd6f4,
    yellow =0xffcdd6f4,
    orange =0xffcdd6f4,
    magenta =0xffcdd6f4,
    grey =0xffcdd6f4,
    transparent =0xffcdd6f4,
    mauve =0xffcdd6f4,

    bar = {
        bg =colors.transparent,
        border = 0xffcdd6f4,
    },

    popup = {
        bg = 0xffcdd6f4,
        border = 0xffcdd6f4,
    },

    bg1 =colors.transparent,
    bg2 =colors.transparent,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then return color end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}

selected = monotone

selected.bar.bg = selected.with_alpha(colors.bar.bg, 0.2)
selected.bg1 = selected.with_alpha(colors.bg1, 0.2)
selected.bg2 = selected.transparent
return selected
