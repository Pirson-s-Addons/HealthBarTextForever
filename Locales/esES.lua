local ADDON_NAME, ns = ...

-- ==========================================
-- ESPAÑOL (esES / esMX)
-- ==========================================
local locale = GetLocale()
if locale ~= "esES" and locale ~= "esMX" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Opciones de Health Bar Text Forever"
L["GENERAL"] = "General"
L["GENERAL_HEADER"] = "Configuración General"
L["DEFAULTS"] = "Valores por defecto"
L["VERSION"] = "Versión:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Enlaces"
L["COMMANDS"] = "Comandos"
L["SELECT"] = "Seleccionar"
L["SELECT_TOOLTIP"] = "Selecciona el enlace entero para que puedas copiarlo con Ctrl+C. WoW no deja a los addons escribir en el portapapeles, así que el último paso lo das tú."
L["ABOUT_DESC"] = "Muestra siempre la vida y el poder en los marcos del jugador, el objetivo, el foco y el objetivo del objetivo, no solo al pasar el ratón. En General eliges en qué marcos y con qué formato cada uno."
L["CMD_OPEN"] = "Abre el panel de opciones."
L["MODE"] = "Texto de vida"
L["MODE_TOOLTIP"] = "Cómo se muestran la vida y el poder en este marco. Siempre visible, no solo al pasar el ratón."
L["SHOW_POWER"] = "Mostrar en las barras de poder"
L["SHOW_POWER_TOOLTIP"] = "Muestra también el texto en las barras de maná, ira, energía... Desactivado, esas barras vuelven al comportamiento de Blizzard."
L["NUMERIC"] = "Valor (1.203 / 1.500)"
L["PERCENT"] = "Porcentaje (86%)"
L["SHORT"] = "Abreviado (13mil / 14mil)"
L["BOTH"] = "Ambos (86% 1.203 / 1.500)"
L["FRAMES_HEADER"] = "Marcos"
L["FRAME_PLAYER"] = "Jugador"
L["FRAME_TARGET"] = "Objetivo"
L["FRAME_TARGETTARGET"] = "Objetivo del objetivo"
L["FRAME_FOCUS"] = "Foco"
L["FRAME_FOCUSTARGET"] = "Objetivo del foco"
L["SHOW_FRAME_TOOLTIP"] = "Muestra el texto en este marco. Desactivado, el marco vuelve al comportamiento de Blizzard."
