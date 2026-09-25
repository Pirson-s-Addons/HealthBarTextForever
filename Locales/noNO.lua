local ADDON_NAME, ns = ...

-- ==========================================
-- NORSK (noNO)
-- ==========================================
local locale = GetLocale()
if locale ~= "noNO" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Health Bar Text Forever – alternativer"
L["GENERAL"] = "Generelt"
L["GENERAL_HEADER"] = "Generelle innstillinger"
L["DEFAULTS"] = "Standardverdier"
L["VERSION"] = "Versjon:"
L["AUTHOR"] = "Forfatter:"
L["LINKS"] = "Lenker"
L["COMMANDS"] = "Kommandoer"
L["SELECT"] = "Merk"
L["SELECT_TOOLTIP"] = "Merker hele lenken slik at du kan kopiere den med Ctrl+C. WoW lar ikke tillegg skrive til utklippstavlen, så det siste steget tar du selv."
L["ABOUT_DESC"] = "Viser alltid helse og kraft på spiller-, mål-, fokus- og målets mål-rammen, ikke bare når du holder musen over. Velg under Generelt hvilke rammer og formatet for hver."
L["CMD_OPEN"] = "Åpner innstillingene."
L["MODE"] = "Helsetekst"
L["MODE_TOOLTIP"] = "Hvordan helse og kraft vises på denne rammen. Alltid synlig, ikke bare når du holder musen over."
L["SHOW_POWER"] = "Vis på kraftlinjer"
L["SHOW_POWER_TOOLTIP"] = "Viser teksten også på linjene for mana, raseri, energi... Når det er av, oppfører de linjene seg som hos Blizzard igjen."
L["NUMERIC"] = "Verdi (1 203 / 1 500)"
L["PERCENT"] = "Prosent (86 %)"
L["SHORT"] = "Forkortet (13K / 14K)"
L["BOTH"] = "Begge (86 % 1 203 / 1 500)"
L["FRAMES_HEADER"] = "Rammer"
L["FRAME_PLAYER"] = "Spiller"
L["FRAME_TARGET"] = "Mål"
L["FRAME_TARGETTARGET"] = "Målets mål"
L["FRAME_FOCUS"] = "Fokus"
L["FRAME_FOCUSTARGET"] = "Fokusets mål"
L["SHOW_FRAME_TOOLTIP"] = "Viser teksten på denne rammen. Når det er av, oppfører rammen seg som hos Blizzard igjen."
