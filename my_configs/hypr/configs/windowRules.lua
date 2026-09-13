-- =====================================================
-- WINDOWS AND WORKSPACES
-- =====================================================


-- =====================================================
-- FORCE TILE
-- =====================================================

hl.window_rule({
    match = { class = "kitty" },
    float = false,
})

hl.window_rule({
    match = { class = "Godot" },
    float = false,
})


-- =====================================================
-- FORCE FLOAT
-- =====================================================

hl.window_rule({
    match = { class = "org.gnome.Nautilus" },
    float = true,
})

hl.window_rule({
    match = { class = "org.qbittorrent.qBittorrent" },
    float = true,
})

hl.window_rule({
    match = { class = "com.obsproject.Studio" },
    float = true,
})

hl.window_rule({
    match = { class = "feh" },
    float = true,
})

hl.window_rule({
    match = { class = "waypaper" },
    float = true,
})

hl.window_rule({
    match = { class = "nemo" },
    float = true,
})

hl.window_rule({
    match = { class = "io.github.airctl" },
    float = true,
})

hl.window_rule({
    match = { title = "^(HyprEmoji)$" },
    float = true,
})


-- =====================================================
-- FORCE SPECIFIC WORKSPACE
-- =====================================================

hl.window_rule({
    match = { class = "com.obsproject.Studio" },
    workspace = "3 silent",
    suppress_event = "activate activatefocus",
})

hl.window_rule({
    match = { class = "Surfshark" },
    workspace = "3 silent",
    suppress_event = "activate activatefocus",
})


-- =====================================================
-- TRANSPARENCY
-- =====================================================

hl.window_rule({
    match = { class = "kitty" },
    opacity = "0.95 0.95",
})

hl.window_rule({
    match = { class = "org.gnome.Nautilus" },
    opacity = "0.98 1",
})

hl.window_rule({
    match = { class = "firefox" },
    opacity = "0.96 0.96",
})

hl.window_rule({
    match = { class = "waypaper" },
    opacity = "0.96 0.96",
})


-- =====================================================
-- AUDIO CONTROL DROPDOWN
-- =====================================================

hl.window_rule({
    name = "audio-control-dropdown",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    move = { "100%-25.5%", "4%" },
    size = { "25%", "17%" },
})


-- =====================================================
-- WIFI CONTROL DROPDOWN
-- =====================================================

hl.window_rule({
    name = "wifi-control-dropdown",
    match = { class = "nm-connection-editor" },
    float = true,
    move = { "100%-25.5%", "4%" },
    size = { "25%", "17%" },
})


-- =====================================================
-- AIRCTL DROPDOWN
-- =====================================================

hl.window_rule({
    name = "airctl-dropdown",
    match = { class = "io.github.airctl" },
    move = { "100%-25.5%", "4%" },
    size = { "25%", "17%" },
})


-- =====================================================
-- IGNORE MAXIMIZE REQUESTS
-- =====================================================

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})


-- =====================================================
-- HYPREMOJI
-- =====================================================

hl.window_rule({
    match = { title = "^(HyprEmoji)$" },
    move = { "cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.05)" },
})
