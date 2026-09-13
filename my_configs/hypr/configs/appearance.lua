-- -----------------------------------------------------
-- Appearance / Pywal
-- -----------------------------------------------------

local home = os.getenv("HOME")
local wal_file = home .. "/.cache/wal/colors-hyprland.conf"


-- -----------------------------------------------------
-- Read Pywal colors
-- -----------------------------------------------------

local function get_wal_color(name)
    local file = io.open(wal_file, "r")

    if not file then
        return nil
    end

    for line in file:lines() do
        local color = line:match("^%s*%$" .. name .. "%s*=%s*(.-)%s*$")

        if color then
            file:close()
            return color
        end
    end

    file:close()
    return nil
end


local color2 = get_wal_color("color2")
local color8 = get_wal_color("color8")


-- -----------------------------------------------------
-- General
-- -----------------------------------------------------

hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 12,

        border_size = 3,

        col = {
            active_border = color2,
            inactive_border = color8,
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },


    -- -------------------------------------------------
    -- Decoration
    -- -------------------------------------------------

    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,

            vibrancy = 0.1696,
        },
    },
})
