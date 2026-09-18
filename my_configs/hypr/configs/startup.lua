-- =====================================================
-- AUTOSTART
-- =====================================================
-- hl.exec_cmd() spawns an async process (no "&"/"nohup" needed).
-- Autostart commands run inside the hyprland.start event hook.

hl.on("hyprland.start", function()
    -- Wallpaper daemon
    hl.exec_cmd("swww-daemon")

    -- Restore wallpaper
    hl.exec_cmd("waypaper --restore")

    -- Waybar
    hl.exec_cmd("waybar")

    -- Cursor
    hl.exec_cmd('hyprctl setcursor "Breeze Dark" 24')

    -- Surfshark
    hl.exec_cmd("flatpak run com.surfshark.Surfshark")

    -- Polkit agent
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Volume bar updater
    hl.exec_cmd('python3 "$HOME/.config/eww/volume-bar/update-volume-bar.py"')

    -- OBS replay buffer
    hl.exec_cmd("obs --startreplaybuffer --disable-shutdown-check")

	-- Qbittorrent
	hl.exec_cmd("qbittorrent")

	-- kill eww to stop stupid bug
	hl.exec_cmd("killall eww")
end)
