local ADDON_NAME, ns = ...

-- ==========================================
-- DEUTSCH (deDE)
-- ==========================================
local locale = GetLocale()
if locale ~= "deDE" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Health Bar Text Forever – Optionen"
L["GENERAL"] = "Allgemein"
L["GENERAL_HEADER"] = "Allgemeine Einstellungen"
L["DEFAULTS"] = "Standardwerte"
L["VERSION"] = "Version:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Links"
L["COMMANDS"] = "Befehle"
L["SELECT"] = "Auswählen"
L["SELECT_TOOLTIP"] = "Markiert den ganzen Link, damit du ihn mit Strg+C kopieren kannst. WoW erlaubt Addons nicht, in die Zwischenablage zu schreiben, den letzten Schritt machst also du."
L["ABOUT_DESC"] = "Zeigt Gesundheit und Energie immer auf dem Spieler-, Ziel-, Fokus- und Ziel-des-Ziels-Rahmen an, nicht nur bei Mauskontakt. Unter Allgemein wählst du die Rahmen und das Format für jeden."
L["CMD_OPEN"] = "Öffnet die Einstellungen."
L["MODE"] = "Gesundheitstext"
L["MODE_TOOLTIP"] = "Wie Gesundheit und Energie auf diesem Rahmen angezeigt werden. Immer sichtbar, nicht nur bei Mauskontakt."
L["SHOW_POWER"] = "Auf Energieleisten anzeigen"
L["SHOW_POWER_TOOLTIP"] = "Zeigt den Text auch auf den Mana-, Wut-, Energie-...leisten. Ausgeschaltet verhalten sich diese Leisten wieder wie bei Blizzard."
L["NUMERIC"] = "Wert (1.203 / 1.500)"
L["PERCENT"] = "Prozent (86%)"
L["SHORT"] = "Kurz (13K / 14K)"
L["BOTH"] = "Beides (86% 1.203 / 1.500)"
L["FRAMES_HEADER"] = "Rahmen"
L["FRAME_PLAYER"] = "Spieler"
L["FRAME_TARGET"] = "Ziel"
L["FRAME_TARGETTARGET"] = "Ziel des Ziels"
L["FRAME_FOCUS"] = "Fokus"
L["FRAME_FOCUSTARGET"] = "Ziel des Fokus"
L["SHOW_FRAME_TOOLTIP"] = "Zeigt den Text auf diesem Rahmen. Ausgeschaltet verhält sich der Rahmen wieder wie bei Blizzard."
