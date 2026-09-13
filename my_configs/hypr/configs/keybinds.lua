-- =====================================================
-- KEYBINDINGS
-- =====================================================

local mainMod = "SUPER"

-- Programs
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "bash ~/.config/rofi/launchers/type-2/launcher.sh"
local rofiMixer = "bash ~/.config/rofi/launchers/type-2/rofi-mixer.sh"
local browser = "librewolf"
local textEditor = "code"


-- =====================================================
-- APPLICATIONS
-- =====================================================

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout"))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(textEditor))

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("waypaper"))

hl.bind("F8", hl.dsp.exec_cmd("/home/$USER/Documents/github/PigaDotfiles/PigaAutoclicker/start.sh"))

hl.bind("F7", hl.dsp.exec_cmd("/home/$USER/Documents/github/PigaDotfiles/PigaAutoclicker/stop.sh"))

hl.bind("F9", hl.dsp.exec_cmd("obs-cmd --websocket obsws://localhost:4444 replay save"))


-- =====================================================
-- ROFI / UTILITIES
-- =====================================================

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(rofiMixer))

hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("hypremoji"))


-- =====================================================
-- MOVE FOCUS
-- =====================================================

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))


-- =====================================================
-- SWITCH WORKSPACES / MOVE WINDOW TO WORKSPACE
-- =====================================================

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0

    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end


-- =====================================================
-- SPECIAL WORKSPACE / SCRATCHPAD
-- =====================================================

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


-- =====================================================
-- SCROLL THROUGH WORKSPACES
-- =====================================================

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))


-- =====================================================
-- MOVE / RESIZE WINDOWS (mouse drag)
-- =====================================================

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- =====================================================
-- VOLUME / BRIGHTNESS
-- =====================================================

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })


-- =====================================================
-- SCREENSHOTS
-- =====================================================

hl.bind("Print", hl.dsp.exec_cmd([[
    sh -c 'REGION=$(slurp) || exit; grim -g "$REGION" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png && dunstify "Screenshot of the region taken" -t 1000'
]]))

hl.bind("SHIFT + Print", hl.dsp.exec_cmd([[
    grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png && dunstify "Screenshot of the whole screen taken" -t 1000
]]))


-- =====================================================
-- MEDIA KEYS
-- =====================================================

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
