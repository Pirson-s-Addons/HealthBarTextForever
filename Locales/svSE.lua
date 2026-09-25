local ADDON_NAME, ns = ...

-- ==========================================
-- SVENSKA (svSE)
-- ==========================================
local locale = GetLocale()
if locale ~= "svSE" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Health Bar Text Forever – alternativ"
L["GENERAL"] = "Allmänt"
L["GENERAL_HEADER"] = "Allmänna inställningar"
L["DEFAULTS"] = "Standardvärden"
L["VERSION"] = "Version:"
L["AUTHOR"] = "Författare:"
L["LINKS"] = "Länkar"
L["COMMANDS"] = "Kommandon"
L["SELECT"] = "Markera"
L["SELECT_TOOLTIP"] = "Markerar hela länken så att du kan kopiera den med Ctrl+C. WoW låter inte tillägg skriva till urklipp, så det sista steget gör du själv."
L["ABOUT_DESC"] = "Visar alltid hälsa och kraft på spelar-, mål-, fokus- och målets mål-ramen, inte bara när du för musen över. Välj under Allmänt vilka ramar och formatet för var och en."
L["CMD_OPEN"] = "Öppnar inställningarna."
L["MODE"] = "Hälsotext"
L["MODE_TOOLTIP"] = "Hur hälsa och kraft visas på den här ramen. Alltid synligt, inte bara när du för musen över."
L["SHOW_POWER"] = "Visa på kraftmätare"
L["SHOW_POWER_TOOLTIP"] = "Visar texten även på mätarna för mana, raseri, energi... Avstängt beter sig de mätarna som hos Blizzard igen."
L["NUMERIC"] = "Värde (1 203 / 1 500)"
L["PERCENT"] = "Procent (86 %)"
L["SHORT"] = "Förkortat (13K / 14K)"
L["BOTH"] = "Båda (86 % 1 203 / 1 500)"
L["FRAMES_HEADER"] = "Ramar"
L["FRAME_PLAYER"] = "Spelare"
L["FRAME_TARGET"] = "Mål"
L["FRAME_TARGETTARGET"] = "Målets mål"
L["FRAME_FOCUS"] = "Fokus"
L["FRAME_FOCUSTARGET"] = "Fokusens mål"
L["SHOW_FRAME_TOOLTIP"] = "Visar texten på den här ramen. Avstängt beter sig ramen som hos Blizzard igen."
