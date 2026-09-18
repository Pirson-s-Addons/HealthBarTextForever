local _, ns = ...

-- Ingles por defecto: cualquier clave sin traducir cae aqui.
local L = {
    MODE = "Health text",
    MODE_TOOLTIP = "How health and power are shown on the player and target frames. Always visible, not only on mouseover.",
    SHOW_POWER = "Show on power bars",
    SHOW_POWER_TOOLTIP = "Also show the text on the mana, rage, energy... bars. When off, those bars go back to Blizzard's behavior.",
    NUMERIC = "Value (1,203 / 1,500)",
    PERCENT = "Percent (86%)",
    BOTH = "Both (86% 1,203 / 1,500)",
}

local locale = GetLocale()
if locale == "esES" or locale == "esMX" then
    L.MODE = "Texto de vida"
    L.MODE_TOOLTIP = "Cómo se muestran la vida y el poder en los marcos del jugador y del objetivo. Siempre visible, no solo al pasar el ratón."
    L.SHOW_POWER = "Mostrar en las barras de poder"
    L.SHOW_POWER_TOOLTIP = "Muestra también el texto en las barras de maná, ira, energía... Desactivado, esas barras vuelven al comportamiento de Blizzard."
    L.NUMERIC = "Valor (1.203 / 1.500)"
    L.PERCENT = "Porcentaje (86%)"
    L.BOTH = "Ambos (86% 1.203 / 1.500)"
end

ns.L = L
