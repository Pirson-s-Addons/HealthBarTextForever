local ADDON_NAME, ns = ...

-- ==========================================
-- IDIOMA POR DEFECTO (enUS / enGB)
-- ==========================================
-- Este fichero define TODAS las claves. Los demas Locales/<idioma>.lua se
-- cargan despues y sobrescriben las suyas; lo que falte se queda en ingles.

local L = ns.L or {}
ns.L = L

L["OPTIONS_TITLE"] = "Health Bar Text Forever Options"
L["GENERAL"] = "General"
L["GENERAL_HEADER"] = "General Settings"
L["DEFAULTS"] = "Reset to defaults"
L["VERSION"] = "Version:"
L["AUTHOR"] = "Author:"
L["LINKS"] = "Links"
L["COMMANDS"] = "Commands"
L["SELECT"] = "Select"
L["SELECT_TOOLTIP"] = "Selects the whole link so you can copy it with Ctrl+C. WoW does not let addons write to the clipboard, so the last step is yours."
L["ABOUT_DESC"] = "Always shows health and power on the player, target, focus and target-of-target frames, not only on mouseover. Choose in General which frames show it and the format of each one."
L["CMD_OPEN"] = "Opens the options panel."
L["MODE"] = "Health text"
L["MODE_TOOLTIP"] = "How health and power are shown on this frame. Always visible, not only on mouseover."
L["SHOW_POWER"] = "Show on power bars"
L["SHOW_POWER_TOOLTIP"] = "Also show the text on the mana, rage, energy... bars. When off, those bars go back to Blizzard's behavior."
L["NUMERIC"] = "Value (1,203 / 1,500)"
L["PERCENT"] = "Percent (86%)"
L["SHORT"] = "Short (13K / 14K)"
L["BOTH"] = "Both (86% 1,203 / 1,500)"
L["FRAMES_HEADER"] = "Frames"
L["FRAME_PLAYER"] = "Player"
L["FRAME_TARGET"] = "Target"
L["FRAME_TARGETTARGET"] = "Target of target"
L["FRAME_FOCUS"] = "Focus"
L["FRAME_FOCUSTARGET"] = "Target of focus"
L["SHOW_FRAME_TOOLTIP"] = "Show the text on this frame. When off, the frame goes back to Blizzard's behavior."
