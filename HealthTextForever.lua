-- Health Text Forever: la vida y el poder (mana, ira, energia...) del jugador y
-- de su objetivo siempre visibles en sus barras, solo para WoW Forever.
--
-- Forever trae la opcion de Blizzard "Texto de estado", pero por defecto en
-- "Ninguno" (el texto solo sale al pasar el raton) y con otros formatos: su
-- "Ambos" pone el % a la izquierda y el valor actual a la derecha, sin el maximo.
-- Este addon pinta su propio texto encima y oculta el de Blizzard.
--
-- Valores secretos: en Forever UnitHealth, UnitPower y sus Percent son secretos
-- para los addons en combate, y los maximos pueden serlo segun la unidad
-- (SecretWhenUnitHealthMaxRestricted / ...PowerMaxRestricted). Aqui NO se hace
-- ninguna cuenta ni comparacion con ellos: el porcentaje lo calcula el cliente
-- (curva CurveConstants.ScaleTo100) y los numeros solo se formatean
-- (BreakUpLargeNumbers, string.format) para pasarlos a SetText.
-- Contrastado con Gethe/wow-ui-source, rama "forever".

local ADDON_NAME, ns = ...
local L = ns.L

local DEFAULT_MODE = "NUMERIC"
local SCALE = CurveConstants.ScaleTo100

-- Que leer para cada tipo de barra
local SOURCES = {
    health = {
        value = function(unit) return UnitHealth(unit) end,
        max = function(unit) return UnitHealthMax(unit) end,
        percent = function(unit) return UnitHealthPercent(unit, true, SCALE) end,
        blizzardTexts = { "HealthBarText", "LeftText", "RightText" },
    },
    power = {
        value = function(unit) return UnitPower(unit) end,
        max = function(unit) return UnitPowerMax(unit) end,
        percent = function(unit) return UnitPowerPercent(unit, nil, false, SCALE) end,
        blizzardTexts = { "ManaBarText", "LeftText", "RightText" },
    },
}

local function Numeric(src, unit)
    return BreakUpLargeNumbers(src.value(unit)) .. " / " .. BreakUpLargeNumbers(src.max(unit))
end

local function Percent(src, unit)
    return string.format("%.0f%%", src.percent(unit))
end

local FORMATS = {
    NUMERIC = Numeric,
    PERCENT = Percent,
    BOTH = function(src, unit) return Percent(src, unit) .. " " .. Numeric(src, unit) end,
}

-- Una entrada por barra: { unit, kind, bar, text }
local bars = {}

local function IsEnabled(entry)
    return entry.kind == "health" or HealthTextForeverDB.showPower
end

local function Update(entry)
    local text, unit = entry.text, entry.unit
    -- Sin objetivo no hay nada que pintar, y con el objetivo muerto Blizzard ya
    -- pone su "Muerto" (DeadText, que no se toca) en el centro de la barra. La
    -- barra del jugador no tiene DeadText: ahi se sigue viendo el 0.
    if not IsEnabled(entry) or not UnitExists(unit) or (unit == "target" and UnitIsDeadOrGhost(unit)) then
        text:SetText("")
        return
    end
    local format = FORMATS[HealthTextForeverDB.mode] or FORMATS[DEFAULT_MODE]
    text:SetText(format(SOURCES[entry.kind], unit))
end

local function UpdateUnit(unit, kind)
    for _, entry in ipairs(bars) do
        if entry.unit == unit and (not kind or entry.kind == kind) then Update(entry) end
    end
end

-- Los textos de Blizzard se hacen invisibles en vez de ocultarse: su codigo los
-- vuelve a mostrar con cada actualizacion, pero no toca su alpha. Con la barra
-- desactivada se les devuelve el alpha y queda el comportamiento de Blizzard.
local function ApplyBlizzardTexts(entry)
    local alpha = IsEnabled(entry) and 0 or 1
    for _, key in ipairs(SOURCES[entry.kind].blizzardTexts) do
        if entry.bar[key] then entry.bar[key]:SetAlpha(alpha) end
    end
end

local function UpdateAll()
    for _, entry in ipairs(bars) do
        ApplyBlizzardTexts(entry)
        Update(entry)
    end
end

local function AddBar(unit, kind, bar)
    local text = bar:CreateFontString(nil, "OVERLAY", "TextStatusBarText")
    text:SetPoint("CENTER", bar, "CENTER", 0, 0)
    bars[#bars + 1] = { unit = unit, kind = kind, bar = bar, text = text }
end

local function CreateOptions()
    local category = Settings.RegisterVerticalLayoutCategory("Health Text Forever")

    local mode = Settings.RegisterAddOnSetting(category, "HealthTextForever_Mode", "mode",
        HealthTextForeverDB, Settings.VarType.String, L.MODE, DEFAULT_MODE)
    mode:SetValueChangedCallback(UpdateAll)
    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
        container:Add("NUMERIC", L.NUMERIC)
        container:Add("PERCENT", L.PERCENT)
        container:Add("BOTH", L.BOTH)
        return container:GetData()
    end
    Settings.CreateDropdown(category, mode, GetOptions, L.MODE_TOOLTIP)

    local power = Settings.RegisterAddOnSetting(category, "HealthTextForever_ShowPower", "showPower",
        HealthTextForeverDB, Settings.VarType.Boolean, L.SHOW_POWER, true)
    power:SetValueChangedCallback(UpdateAll)
    Settings.CreateCheckbox(category, power, L.SHOW_POWER_TOOLTIP)

    Settings.RegisterAddOnCategory(category)

    SLASH_HEALTHTEXTFOREVER1 = "/htf"
    SlashCmdList.HEALTHTEXTFOREVER = function() Settings.OpenToCategory(category:GetID()) end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterUnitEvent("UNIT_HEALTH", "player", "target")
frame:RegisterUnitEvent("UNIT_MAXHEALTH", "player", "target")
frame:RegisterUnitEvent("UNIT_POWER_UPDATE", "player", "target")
frame:RegisterUnitEvent("UNIT_MAXPOWER", "player", "target")
-- Cambio de tipo de poder: forma de druida, objetivo con otra clase...
frame:RegisterUnitEvent("UNIT_DISPLAYPOWER", "player", "target")

local HEALTH_EVENTS = { UNIT_HEALTH = true, UNIT_MAXHEALTH = true }

frame:SetScript("OnEvent", function(_, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 ~= ADDON_NAME then return end
        HealthTextForeverDB = HealthTextForeverDB or {}
        if not FORMATS[HealthTextForeverDB.mode] then HealthTextForeverDB.mode = DEFAULT_MODE end
        if HealthTextForeverDB.showPower == nil then HealthTextForeverDB.showPower = true end
        CreateOptions()
        local target = TargetFrame.TargetFrameContent.TargetFrameContentMain
        AddBar("player", "health", PlayerFrame_GetHealthBar())
        AddBar("player", "power", PlayerFrame_GetManaBar())
        AddBar("target", "health", target.HealthBarsContainer.HealthBar)
        AddBar("target", "power", target.ManaBar)
        frame:UnregisterEvent("ADDON_LOADED")
        UpdateAll()
    elseif event == "PLAYER_TARGET_CHANGED" then
        UpdateUnit("target")
    elseif event == "PLAYER_ENTERING_WORLD" then
        UpdateAll()
    else
        UpdateUnit(arg1, HEALTH_EVENTS[event] and "health" or "power")
    end
end)
