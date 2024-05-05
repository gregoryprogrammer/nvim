-- TODO use toml parser/serializer to modify alacritty config
-- luarocks install lua-toml --local

function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

function read_file(file)
    local f = assert(io.open(file, "r"))
    local content = f:read("*all")
    f:close()
    return content
end

function save_file(file, content)
    local f = assert(io.open(file, "w"))
    f:write(content)
    f:close()
end

function config_1()
    return {
        font_normal_family = "Terminus (TTF) for Windows",
        font_italic_family = "Terminus (TTF) for Windows",
        font_normal_style = "Regular",
        font_italic_style = "Regular",
        font_size = 9.0,
    }
end

function config_2()
    return {
        font_normal_family = "Terminus (TTF) for Windows",
        font_italic_family = "Terminus (TTF) for Windows",
        font_normal_style = "Bold",
        font_italic_style = "Bold",
        font_size = 12.0,
    }
end

function configure_alacritty(template, c)
    local HOME = os.getenv("HOME")
    local ALACRITTY_TEMPLATE_TOML =  HOME .. "/.config/nvim/lua/delorean/templates/alacritty.template.toml"
    local ALACRITTY_TOML = HOME .. "/.config/alacritty/alacritty.toml"

    template = read_file(ALACRITTY_TEMPLATE_TOML)

    template = template:gsub("#_FONT_NORMAL_FAMILY_#", c.font_normal_family)
    template = template:gsub("#_FONT_ITALIC_FAMILY_#", c.font_italic_family)
    template = template:gsub("#_FONT_NORMAL_STYLE_#", c.font_normal_style)
    template = template:gsub("#_FONT_ITALIC_STYLE_#", c.font_italic_style)
    template = template:gsub("#_FONT_SIZE_#", c.font_size)

    save_file(ALACRITTY_TOML, template)

    -- vim.cmd("<C-w>=<cr>")

    return template
end

function theme_default()
    print("Theme default")
    c = config_1()
    configure_alacritty(template, c)
end

function theme_config_1()
    print("Theme config 1")
    c = config_1()
    configure_alacritty(template, c)
end

function theme_config_2()
    print("Theme config 2")
    c = config_2()
    configure_alacritty(template, c)
end
