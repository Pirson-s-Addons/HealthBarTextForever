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
L["ABOUT_DESC"] = "Always shows health and power on the player, pet, target, focus and target-of-target frames, not only on mouseover. Choose in General which frames show it and the format of each one."
L["CMD_OPEN"] = "Opens the options panel."
L["SHOW_POWER"] = "Show on power bars"
L["SHOW_POWER_TOOLTIP"] = "Also show the text on the mana, rage, energy... bars. When off, those bars go back to Blizzard's behavior."
L["PERCENT"] = "Percent (86%)"
L["FRAMES_HEADER"] = "Frames"
L["FRAME_PLAYER"] = "Player"
L["FRAME_PET"] = "Pet / minion"
L["FRAME_TARGET"] = "Target"
L["FRAME_TARGETTARGET"] = "Target of target"
L["FRAME_FOCUS"] = "Focus"
L["FRAME_FOCUSTARGET"] = "Target of focus"
L["SHOW_FRAME_TOOLTIP"] = "Show the text on this frame. When off, the frame goes back to Blizzard's behavior."
L["EDIT_FRAME"] = "Edit frame:"
L["EDIT_FRAME_TOOLTIP"] = "Choose which frame to set up. The settings below apply only to that frame."
L["SHOW_FRAME"] = "Show text on this frame"
L["HOVER_ONLY"] = "Only on mouseover"
L["HOVER_ONLY_TOOLTIP"] = "Hide the text until you hover the bar, like Blizzard's None option, but keeping this addon's format and position."
L["HEALTH_BAR"] = "Health bar"
L["POWER_BAR"] = "Power bar"
L["VALUE"] = "Value"
L["VALUE_TOOLTIP"] = "Value of the bar, with or without the maximum, in full or shortened, or hidden."
L["VALUE_FULL"] = "Full (1,203 / 1,500)"
L["VALUE_SHORT"] = "Short (13K / 14K)"
L["VALUE_CURRENT"] = "Current (1,203)"
L["VALUE_CURRENT_SHORT"] = "Current, short (13K)"
L["VALUE_NONE"] = "Hidden"
L["PERCENT_TOOLTIP"] = "Also show the percentage. If it goes in the same spot as the value, both are joined in one line (86% 1,203 / 1,500)."
L["POSITION"] = "Position"
L["POSITION_TOOLTIP"] = "Where this text goes: inside the bar (left, center or right) or just outside it, next to the bar."
L["POS_LEFT"] = "Left"
L["POS_CENTER"] = "Center"
L["POS_RIGHT"] = "Right"
L["POS_OUTLEFT"] = "Outside left"
L["POS_OUTRIGHT"] = "Outside right"
