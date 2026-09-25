local ADDON_NAME, ns = ...

-- ==========================================
-- ITALIANO (itIT)
-- ==========================================
local locale = GetLocale()
if locale ~= "itIT" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Opzioni di Health Bar Text Forever"
L["GENERAL"] = "Generale"
L["GENERAL_HEADER"] = "Impostazioni generali"
L["DEFAULTS"] = "Valori predefiniti"
L["VERSION"] = "Versione:"
L["AUTHOR"] = "Autore:"
L["LINKS"] = "Collegamenti"
L["COMMANDS"] = "Comandi"
L["SELECT"] = "Seleziona"
L["SELECT_TOOLTIP"] = "Seleziona l'intero link così puoi copiarlo con Ctrl+C. WoW non permette agli addon di scrivere negli appunti, quindi l'ultimo passo spetta a te."
L["ABOUT_DESC"] = "Mostra sempre salute e potere sui riquadri di giocatore, bersaglio, focus e bersaglio del bersaglio, non solo al passaggio del mouse. In Generale scegli i riquadri e il formato di ciascuno."
L["CMD_OPEN"] = "Apre le impostazioni."
L["MODE"] = "Testo della salute"
L["MODE_TOOLTIP"] = "Come vengono mostrati salute e potere su questo riquadro. Sempre visibile, non solo al passaggio del mouse."
L["SHOW_POWER"] = "Mostra sulle barre del potere"
L["SHOW_POWER_TOOLTIP"] = "Mostra il testo anche sulle barre di mana, ira, energia... Disattivato, quelle barre tornano al comportamento di Blizzard."
L["NUMERIC"] = "Valore (1.203 / 1.500)"
L["PERCENT"] = "Percentuale (86%)"
L["SHORT"] = "Abbreviato (13K / 14K)"
L["BOTH"] = "Entrambi (86% 1.203 / 1.500)"
L["FRAMES_HEADER"] = "Riquadri"
L["FRAME_PLAYER"] = "Giocatore"
L["FRAME_TARGET"] = "Bersaglio"
L["FRAME_TARGETTARGET"] = "Bersaglio del bersaglio"
L["FRAME_FOCUS"] = "Focus"
L["FRAME_FOCUSTARGET"] = "Bersaglio del focus"
L["SHOW_FRAME_TOOLTIP"] = "Mostra il testo su questo riquadro. Disattivato, il riquadro torna al comportamento di Blizzard."
