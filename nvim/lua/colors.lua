-------------- YOUR USABLE FUCKING COLOR MANAGER -------------
-- set(...) function usage:
----- first argument is the target highlight group
--------- ":hi "+<TAB> to see all highlight groups
----- remaining arguments are keys from color_map and attr_map
----- examples:
--------- set("@keyword", "yellow", "bold")
------------- sets every keyword to bold yellow
--------- set("@comment", "black_l", "underdashed", "italic")
------------- multiple attrs can be used together
--------- set("@variable", "bg=magenta")
------------- "bg=" prefix sets the color as background

-- match table for colors
local color_map = {
    black = 0,
    red = 1,
    green = 2,
    yellow = 3,
    blue = 4,
    magenta = 5,
    cyan = 6,
    white = 7,
    black_l = 8,
    red_l = 9,
    green_l = 10,
    yellow_l = 11,
    blue_l = 12,
    magenta_l = 13,
    cyan_l = 14,
    white_l = 15
}

local M = {}

-- match table for attributes
local attr_map = {
    bold = "bold",
    underline = "underline",
    undercurl = "undercurl",
    underdouble = "underdouble",
    underdotted = "underdotted",
    underdashed = "underdashed",
    strikethrough = "strikethrough",
    reverse = "reverse",
    inverse = "inverse",
    italic = "italic",
    standout = "standout",
    altfont = "altfont",
    nocombine = "nocombine",
    none = "NONE"
}

function M.set(...)
    local args = {...}
    local settings = {}
    
    if #args < 1 then return end
    
    -- lua indexes arrays from 1 btw
    local keyword = args[1]

    for i = 2, #args do
        local arg = args[i]

        -- check if fg color
        if color_map[arg] then
            settings.ctermfg = color_map[arg]
        -- check if bg color
        elseif arg:match("^bg=") then
            local bg_color = arg:gsub("^bg=", "")
            if color_map[bg_color] then
                settings.ctermbg = color_map[bg_color]
            else return end
        -- check if attribute
        elseif attr_map[arg] then
            settings[arg] = true
        else return end
    end
    
    vim.api.nvim_set_hl(0, keyword, settings)
end

return M
