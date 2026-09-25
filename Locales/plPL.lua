local ADDON_NAME, ns = ...

-- ==========================================
-- POLSKI (plPL)
-- ==========================================
local locale = GetLocale()
if locale ~= "plPL" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Opcje Health Bar Text Forever"
L["GENERAL"] = "Ogólne"
L["GENERAL_HEADER"] = "Ustawienia ogólne"
L["DEFAULTS"] = "Wartości domyślne"
L["VERSION"] = "Wersja:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Linki"
L["COMMANDS"] = "Polecenia"
L["SELECT"] = "Zaznacz"
L["SELECT_TOOLTIP"] = "Zaznacza cały link, abyś mógł go skopiować skrótem Ctrl+C. WoW nie pozwala dodatkom zapisywać do schowka, więc ostatni krok należy do ciebie."
L["ABOUT_DESC"] = "Zawsze pokazuje zdrowie i moc na ramkach gracza, celu, fokusu i celu celu, nie tylko po najechaniu myszą. W sekcji Ogólne wybierzesz ramki i format każdej z nich."
L["CMD_OPEN"] = "Otwiera ustawienia."
L["MODE"] = "Tekst zdrowia"
L["MODE_TOOLTIP"] = "Jak zdrowie i moc są pokazywane na tej ramce. Zawsze widoczne, nie tylko po najechaniu myszą."
L["SHOW_POWER"] = "Pokazuj na paskach mocy"
L["SHOW_POWER_TOOLTIP"] = "Pokazuje tekst także na paskach many, szału, energii... Po wyłączeniu te paski działają tak jak u Blizzarda."
L["NUMERIC"] = "Wartość (1 203 / 1 500)"
L["PERCENT"] = "Procent (86%)"
L["SHORT"] = "Skrót (13 tys. / 14 tys.)"
L["BOTH"] = "Oba (86% 1 203 / 1 500)"
L["FRAMES_HEADER"] = "Ramki"
L["FRAME_PLAYER"] = "Gracz"
L["FRAME_TARGET"] = "Cel"
L["FRAME_TARGETTARGET"] = "Cel celu"
L["FRAME_FOCUS"] = "Fokus"
L["FRAME_FOCUSTARGET"] = "Cel fokusu"
L["SHOW_FRAME_TOOLTIP"] = "Pokazuje tekst na tej ramce. Po wyłączeniu ramka działa tak jak u Blizzarda."
