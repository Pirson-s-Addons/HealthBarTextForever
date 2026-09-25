local ADDON_NAME, ns = ...

-- ==========================================
-- ČEŠTINA (csCZ)
-- ==========================================
local locale = GetLocale()
if locale ~= "csCZ" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Možnosti Health Bar Text Forever"
L["GENERAL"] = "Obecné"
L["GENERAL_HEADER"] = "Obecné nastavení"
L["DEFAULTS"] = "Výchozí hodnoty"
L["VERSION"] = "Verze:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Odkazy"
L["COMMANDS"] = "Příkazy"
L["SELECT"] = "Vybrat"
L["SELECT_TOOLTIP"] = "Vybere celý odkaz, abys ho mohl zkopírovat pomocí Ctrl+C. WoW nedovolí doplňkům zapisovat do schránky, takže poslední krok je na tobě."
L["ABOUT_DESC"] = "Vždy zobrazuje zdraví a energii na rámečcích hráče, cíle, fokusu a cíle cíle, nejen při najetí myší. V sekci Obecné vybereš rámečky a formát každého z nich."
L["CMD_OPEN"] = "Otevře nastavení."
L["MODE"] = "Text zdraví"
L["MODE_TOOLTIP"] = "Jak se zobrazuje zdraví a energie na tomto rámečku. Vždy viditelné, nejen při najetí myší."
L["SHOW_POWER"] = "Zobrazit na lištách energie"
L["SHOW_POWER_TOOLTIP"] = "Zobrazí text i na lištách many, vzteku, energie... Když je vypnuto, tyto lišty se chovají jako u Blizzardu."
L["NUMERIC"] = "Hodnota (1 203 / 1 500)"
L["PERCENT"] = "Procenta (86 %)"
L["SHORT"] = "Zkráceně (13 tis. / 14 tis.)"
L["BOTH"] = "Obojí (86 % 1 203 / 1 500)"
L["FRAMES_HEADER"] = "Rámečky"
L["FRAME_PLAYER"] = "Hráč"
L["FRAME_TARGET"] = "Cíl"
L["FRAME_TARGETTARGET"] = "Cíl cíle"
L["FRAME_FOCUS"] = "Fokus"
L["FRAME_FOCUSTARGET"] = "Cíl fokusu"
L["SHOW_FRAME_TOOLTIP"] = "Zobrazí text na tomto rámečku. Když je vypnuto, rámeček se chová jako u Blizzardu."
