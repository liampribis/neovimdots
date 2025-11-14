function brighten(hex, brightness)
    local r, g, b = hex:match("#(%x%x)(%x%x)(%x%x)")
    r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
    r = math.min(255, math.floor(r * brightness))
    g = math.min(255, math.floor(g * brightness))
    b = math.min(255, math.floor(b * brightness))
    return string.format("#%02x%02x%02x", r, g, b)
end

local colors = {
    bg = "#08080d",
    fg1 = "#c2b59b",
    red1 = "#e97751",
    red0 = "#b14848",
    orange = "#cf9a45",
    blue0 = "#4b6ac7",
    blue1 = "#7cb0cb",
    blue2 = "#64c9ff",
    turq = "#55c2b1",
}

colors.bg1 = brighten(colors.bg, 4)
colors.bg2 = brighten(colors.bg, 3)
colors.fg0 = brighten(colors.fg1, 0.8)

local groups = {
    Normal = { fg = colors.fg1, bg = colors.bg },
    Visual = { bg = colors.bg1 },
    Comment = { fg = colors.fg0 },
    Constant = { fg = colors.blue0 },
    String = {fg = colors.blue1 },
    Identifier = { fg = colors.orange },
    Function = { link = "Identifier" },
    Statement = { fg = colors.red1 },
    Type = { fg = colors.turq },
    Special = { fg = colors.red0 },
    PreProc = { link = "Statement" },
    ["@variable"] = { fg = colors.blue2 },
    StatusLine = { bg = colors.bg2 },
}

if vim.g.colors_name then
    vim.cmd.hi("clear")
end

vim.opt.termguicolors = true

for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
end
