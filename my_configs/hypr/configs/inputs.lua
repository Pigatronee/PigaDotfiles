-- -----------------------------------------------------
-- Input configuration
-- -----------------------------------------------------

hl.config({
    input = {
        kb_layout = "eu,ru",
        kb_variant = ",phonetic",
        kb_model = "",
        kb_rules = "",

        -- Uncomment if you want Super+Space to toggle layouts
        -- kb_options = "grp:win_space_toggle",

        follow_mouse = 1,

        sensitivity = 0,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- Per-device configuration
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
