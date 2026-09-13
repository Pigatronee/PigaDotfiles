-- See https://wiki.hypr.land/Configuring/Dwindle-Layout/

hl.config({
    dwindle = {
        -- pseudotile = true
        -- Master switch for pseudotiling.
        -- Enable with your keybinds if desired.

        preserve_split = true,
    },


    -- See https://wiki.hypr.land/Configuring/Master-Layout/

    master = {
        new_status = "master",
    },


    -- See https://wiki.hypr.land/Configuring/Variables/#misc

    misc = {
        -- -1 = random wallpapers
        --  0 = disable
        --  1 = enable
        force_default_wallpaper = -1,

        -- Keep the Hyprland logo/anime mascot enabled
        disable_hyprland_logo = false,
    },
})
