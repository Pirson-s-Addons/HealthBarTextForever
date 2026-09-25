-- Health Bar Text Forever: la vida y el poder (mana, ira, energia...) del jugador,
-- su objetivo, su foco y el objetivo de ambos siempre visibles en sus barras,
-- solo para WoW Forever.
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
-- (BreakUpLargeNumbers, AbbreviateNumbers, string.format) para pasarlos a SetText.
-- Contrastado con Gethe/wow-ui-source, rama "forever".

local ADDON_NAME, ns = ...

local DEFAULT_MODE = "NUMERIC"
ns.DEFAULT_MODE = DEFAULT_MODE
-- Marcos que se pueden activar y personalizar por separado (clave = unidad)
local FRAMES = { "player", "target", "targettarget", "focus", "focustarget" }
ns.FRAMES = FRAMES
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

-- "13mil / 14mil". Por debajo de 1.000 AbbreviateNumbers deja el numero tal
-- cual ("999 / 1mil"): no hace falta comparar el valor, que puede ser secreto.
local function Short(src, unit)
    return AbbreviateNumbers(src.value(unit)) .. " / " .. AbbreviateNumbers(src.max(unit))
end

local function Percent(src, unit)
    return string.format("%.0f%%", src.percent(unit))
end

local FORMATS = {
    NUMERIC = Numeric,
    PERCENT = Percent,
    SHORT = Short,
    BOTH = function(src, unit) return Percent(src, unit) .. " " .. Numeric(src, unit) end,
}

-- Una entrada por barra: { unit, kind, bar, text }
local bars = {}

local function IsEnabled(entry)
    return HealthBarTextForeverDB.frames[entry.unit].show and (entry.kind == "health" or HealthBarTextForeverDB.showPower)
end

local function Update(entry)
    local text, unit = entry.text, entry.unit
    -- Sin unidad no hay nada que pintar, y con la unidad muerta Blizzard ya pone
    -- su "Muerto" (DeadText, que no se toca) en el centro de la barra. La barra
    -- del jugador no tiene DeadText: ahi se sigue viendo el 0.
    if not IsEnabled(entry) or not UnitExists(unit) or (unit ~= "player" and UnitIsDeadOrGhost(unit)) then
        text:SetText("")
        return
    end
    local format = FORMATS[HealthBarTextForeverDB.frames[unit].mode] or FORMATS[DEFAULT_MODE]
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
ns.UpdateAll = UpdateAll -- el panel de opciones (UI/Options.lua) lo llama al cambiar algo

-- small: barras del objetivo del objetivo (70x10 y 74x7), con letra mas pequena.
-- Para esas unidades el cliente no manda UNIT_HEALTH: Blizzard las refresca en
-- el OnUpdate del marco, asi que el texto sigue a la propia barra.
local function AddBar(unit, kind, bar, small)
    if not bar then return end
    local text = bar:CreateFontString(nil, "OVERLAY", "TextStatusBarText")
    text:SetPoint("CENTER", bar, "CENTER", 0, 0)
    local entry = { unit = unit, kind = kind, bar = bar, text = text }
    bars[#bars + 1] = entry
    if small then
        local font, _, flags = text:GetFont()
        text:SetFont(font, 8, flags)
        local function Refresh() Update(entry) end
        bar:HookScript("OnValueChanged", Refresh)
        bar:HookScript("OnMinMaxChanged", Refresh)
    end
end

-- Objetivo y foco comparten plantilla (TargetFrameTemplate), y cada uno lleva
-- su "objetivo del objetivo" en totFrame (unidades targettarget / focustarget)
local function AddUnitFrame(unit, frame)
    if not frame then return end
    local main = frame.TargetFrameContent.TargetFrameContentMain
    AddBar(unit, "health", main.HealthBarsContainer.HealthBar)
    AddBar(unit, "power", main.ManaBar)
    if frame.totFrame then
        AddBar(unit .. "target", "health", frame.totFrame.HealthBar, true)
        AddBar(unit .. "target", "power", frame.totFrame.ManaBar, true)
    end
end

local UNIT_EVENTS = {
    "UNIT_HEALTH", "UNIT_MAXHEALTH", "UNIT_POWER_UPDATE", "UNIT_MAXPOWER",
    "UNIT_DISPLAYPOWER", -- cambio de tipo de poder: forma de druida, objetivo con otra clase...
    "UNIT_TARGET",       -- cambia su objetivo: otro "objetivo del objetivo"
}
local HEALTH_EVENTS = { UNIT_HEALTH = true, UNIT_MAXHEALTH = true }

local function OnEvent(self, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 ~= ADDON_NAME then return end
        -- HealthTextForeverDB: ajustes del addon con su nombre antiguo, solo si esa
        -- carpeta sigue instalada (el juego carga las SavedVariables por carpeta).
        local db = HealthBarTextForeverDB or HealthTextForeverDB or {}
        HealthBarTextForeverDB = db
        if db.showPower == nil then db.showPower = true end
        -- Cada marco con su interruptor y su formato. Las versiones anteriores
        -- guardaban un solo formato (db.mode): pasa a ser el de todos los marcos.
        db.frames = db.frames or {}
        for _, unit in ipairs(FRAMES) do
            local f = db.frames[unit] or {}
            if f.show == nil then f.show = true end
            if not FORMATS[f.mode] then f.mode = FORMATS[db.mode] and db.mode or DEFAULT_MODE end
            db.frames[unit] = f
        end
        db.mode = nil
        ns.CreateOptions()
        AddBar("player", "health", PlayerFrame_GetHealthBar())
        AddBar("player", "power", PlayerFrame_GetManaBar())
        AddUnitFrame("target", TargetFrame)
        AddUnitFrame("focus", FocusFrame)
        self:UnregisterEvent("ADDON_LOADED")
        UpdateAll()
    elseif event == "PLAYER_TARGET_CHANGED" then
        UpdateUnit("target")
        UpdateUnit("targettarget")
    elseif event == "PLAYER_FOCUS_CHANGED" then
        UpdateUnit("focus")
        UpdateUnit("focustarget")
    elseif event == "PLAYER_ENTERING_WORLD" then
        UpdateAll()
    elseif event == "UNIT_TARGET" then
        UpdateUnit(arg1 .. "target")
    else
        UpdateUnit(arg1, HEALTH_EVENTS[event] and "health" or "power")
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
-- RegisterUnitEvent admite dos unidades por marco: el foco va en otro
local focusEvents = CreateFrame("Frame")
for _, event in ipairs(UNIT_EVENTS) do
    frame:RegisterUnitEvent(event, "player", "target")
    focusEvents:RegisterUnitEvent(event, "focus")
end
frame:SetScript("OnEvent", OnEvent)
focusEvents:SetScript("OnEvent", OnEvent)
