-- #######################################################################################
-- PIGA CONFIG
-- (SUPER PRO)
-- #######################################################################################

----------------
--  MONITORS  --
----------------

-- See https://wiki.hypr.land/Configuring/Monitors/

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})


----------------
--  PROGRAMS  --
----------------

local terminal = "kitty"
local fileManager = "nautilus"
local menu = "bash ~/.config/rofi/launchers/type-2/launcher.sh"
local rofiMixer = "bash ~/.config/rofi/launchers/type-2/rofi-mixer.sh"
local emojiMenu = "bash ~/.config/rofi/launchers/type-2/rofi-emoji.sh"

local browser = "librewolf"
local textEditor = "code"


----------------
-- ENVIRONMENT --
----------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


----------------
--   IMPORTS   --
----------------

require("configs.keybinds")
require("configs.inputs")
require("configs.startup")
require("configs.windowRules")
require("configs.appearance")
require("configs.animations")
require("configs.dwindle")
require("configs.layerrules")


----------------
--  HYPREMOJI  --
----------------

--require("hypremoji")

