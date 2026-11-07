-- Health Bar Text Forever: la vida y el poder (mana, ira, energia...) del jugador,
-- su mascota, su objetivo, su foco y el objetivo de ambos siempre visibles en sus barras,
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

-- Marcos que se pueden activar y personalizar por separado (clave = unidad)
local FRAMES = { "player", "pet", "target", "targettarget", "focus", "focustarget" }
ns.FRAMES = FRAMES
local KINDS = { "health", "power" }
local SCALE = CurveConstants.ScaleTo100

-- Que leer para cada tipo de barra
local SOURCES = {
    health = {
        value = function(unit) return UnitHealth(unit) end,
        max = function(unit) return UnitHealthMax(unit) end,
        percent = function(unit) return UnitHealthPercent(unit, true, SCALE) end,
        blizzardTexts = { "HealthBarText", "TextString", "LeftText", "RightText" },
    },
    power = {
        value = function(unit) return UnitPower(unit) end,
        max = function(unit) return UnitPowerMax(unit) end,
        percent = function(unit) return UnitPowerPercent(unit, nil, false, SCALE) end,
        blizzardTexts = { "ManaBarText", "TextString", "LeftText", "RightText" },
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

-- Estilos del valor ("NONE" = oculto) y posiciones de cada texto
local VALUES = {
    FULL = Numeric,
    SHORT = Short,
    CURRENT = function(src, unit) return BreakUpLargeNumbers(src.value(unit)) end,
    CURRENT_SHORT = function(src, unit) return AbbreviateNumbers(src.value(unit)) end,
}
ns.VALUE_STYLES = { "FULL", "SHORT", "CURRENT", "CURRENT_SHORT", "NONE" }
ns.POSITIONS = { "LEFT", "CENTER", "RIGHT", "OUTLEFT", "OUTRIGHT" }
-- { punto del texto, punto de la barra, x }: dentro de la barra o pegado a su lado
local ANCHORS = {
    LEFT = { "LEFT", "LEFT", 4 },
    CENTER = { "CENTER", "CENTER", 0 },
    RIGHT = { "RIGHT", "RIGHT", -4 },
    OUTLEFT = { "RIGHT", "LEFT", -4 },
    OUTRIGHT = { "LEFT", "RIGHT", 4 },
}

-- Cada barra (vida y poder de cada marco): que valor, si lleva %, y donde va cada uno
local function DefaultBar()
    return { value = "FULL", valuePos = "CENTER", percent = false, percentPos = "LEFT" }
end
function ns.DefaultFrame()
    return { show = true, hover = false, health = DefaultBar(), power = DefaultBar() }
end
-- Formato unico de las versiones anteriores: { valor, % }, los dos en el centro
local LEGACY = { NUMERIC = { "FULL", false }, SHORT = { "SHORT", false }, PERCENT = { "NONE", true }, BOTH = { "FULL", true } }

-- Una entrada por barra: { unit, kind, bar, valueText, percentText }
local bars = {}

local function IsEnabled(entry)
    return HealthBarTextForeverDB.frames[entry.unit].show and (entry.kind == "health" or HealthBarTextForeverDB.showPower)
end

-- Sin cuentas ni comprobaciones sobre los textos (pueden ser secretos): las
-- ramas solo miran la configuracion.
local function Update(entry)
    local valueText, percentText, unit = entry.valueText, entry.percentText, entry.unit
    -- Sin unidad no hay nada que pintar, y con la unidad muerta Blizzard ya pone
    -- su "Muerto" (DeadText, que no se toca) en el centro de la barra. La barra
    -- del jugador no tiene DeadText: ahi se sigue viendo el 0.
    if not IsEnabled(entry) or not UnitExists(unit) or (unit ~= "player" and UnitIsDeadOrGhost(unit)) then
        valueText:SetText("")
        percentText:SetText("")
        return
    end
    local cfg = HealthBarTextForeverDB.frames[unit][entry.kind]
    local src, value = SOURCES[entry.kind], VALUES[cfg.value]
    if value and cfg.percent and cfg.valuePos == cfg.percentPos then
        -- En el mismo sitio, una sola linea: "86% 1.203 / 1.500"
        valueText:SetText(Percent(src, unit) .. " " .. value(src, unit))
        percentText:SetText("")
        return
    end
    if value then valueText:SetText(value(src, unit)) else valueText:SetText("") end
    if cfg.percent then percentText:SetText(Percent(src, unit)) else percentText:SetText("") end
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

-- "Solo al pasar el raton": los textos se siguen actualizando, invisibles, y la
-- barra que tiene el raton encima los enseña. Solo mira la configuracion.
local function ApplyHover(entry)
    local alpha = (entry.hovered or not HealthBarTextForeverDB.frames[entry.unit].hover) and 1 or 0
    entry.valueText:SetAlpha(alpha)
    entry.percentText:SetAlpha(alpha)
end

-- Izquierda y derecha, sobre el LeftText / RightText de Blizzard si la barra lo
-- tiene: llevan el margen de cada barra (la de poder del objetivo mide 134 px y
-- su RightText va a -13, porque el final queda bajo el borde del marco)
local BLIZZARD_SIDE = { LEFT = "LeftText", RIGHT = "RightText" }

local function Place(text, bar, pos)
    local a, side = ANCHORS[pos], bar[BLIZZARD_SIDE[pos] or ""]
    text:ClearAllPoints()
    if side then
        text:SetPoint(a[1], side, a[1], 0, 0)
    else
        text:SetPoint(a[1], bar, a[2], a[3], 0)
    end
end

local function UpdateAll()
    for _, entry in ipairs(bars) do
        local cfg = HealthBarTextForeverDB.frames[entry.unit][entry.kind]
        Place(entry.valueText, entry.bar, cfg.valuePos)
        Place(entry.percentText, entry.bar, cfg.percentPos)
        ApplyBlizzardTexts(entry)
        ApplyHover(entry)
        Update(entry)
    end
end
ns.UpdateAll = UpdateAll -- el panel de opciones (UI/Options.lua) lo llama al cambiar algo

-- small: barras de la mascota y del objetivo del objetivo (70x10 y 74x7), con letra mas pequena.
-- Para esas unidades el cliente no manda UNIT_HEALTH: Blizzard las refresca en
-- el OnUpdate del marco, asi que el texto sigue a la propia barra.
local function AddBar(unit, kind, bar, small)
    if not bar then return end
    local entry = { unit = unit, kind = kind, bar = bar,
        valueText = bar:CreateFontString(nil, "OVERLAY", "TextStatusBarText"),
        percentText = bar:CreateFontString(nil, "OVERLAY", "TextStatusBarText") }
    bars[#bars + 1] = entry
    -- Todas heredan TextStatusBar (enableMouseMotion): Blizzard usa estos mismos scripts
    local function Hover(on)
        return function()
            entry.hovered = on
            ApplyHover(entry)
        end
    end
    bar:HookScript("OnEnter", Hover(true))
    bar:HookScript("OnLeave", Hover(false))
    if small then
        for _, text in ipairs({ entry.valueText, entry.percentText }) do
            local font, _, flags = text:GetFont()
            text:SetFont(font, 8, flags)
        end
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
        -- Cada marco con su interruptor y, por barra (vida y poder), que valor
        -- muestra, si lleva % y donde va cada uno. Las versiones anteriores
        -- guardaban un formato por marco (f.mode) o uno para todos (db.mode):
        -- se convierte con los dos textos en el centro, como se veia.
        db.frames = db.frames or {}
        for _, unit in ipairs(FRAMES) do
            local f = db.frames[unit] or {}
            if f.show == nil then f.show = true end
            f.hover = f.hover == true
            local old = LEGACY[f.mode] or LEGACY[db.mode]
            for _, kind in ipairs(KINDS) do
                local b = f[kind]
                if type(b) ~= "table" then
                    b = old and { value = old[1], valuePos = "CENTER", percent = old[2], percentPos = "CENTER" } or DefaultBar()
                end
                if not VALUES[b.value] and b.value ~= "NONE" then b.value = "FULL" end
                if not ANCHORS[b.valuePos] then b.valuePos = "CENTER" end
                if not ANCHORS[b.percentPos] then b.percentPos = "LEFT" end
                b.percent = b.percent == true
                f[kind] = b
            end
            f.mode = nil
            db.frames[unit] = f
        end
        db.mode = nil
        ns.CreateOptions()
        AddBar("player", "health", PlayerFrame_GetHealthBar())
        AddBar("player", "power", PlayerFrame_GetManaBar())
        -- Mascota, invocacion (demonio, elemental de agua...): textos de Blizzard en TextString
        AddBar("pet", "health", PetFrameHealthBar, true)
        AddBar("pet", "power", PetFrameManaBar, true)
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
    elseif event == "UNIT_PET" then
        UpdateUnit("pet")
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
frame:RegisterUnitEvent("UNIT_PET", "player")
-- RegisterUnitEvent admite dos unidades por marco: el foco va en otro
local focusEvents = CreateFrame("Frame")
for _, event in ipairs(UNIT_EVENTS) do
    frame:RegisterUnitEvent(event, "player", "target")
    focusEvents:RegisterUnitEvent(event, "focus")
end
frame:SetScript("OnEvent", OnEvent)
focusEvents:SetScript("OnEvent", OnEvent)
