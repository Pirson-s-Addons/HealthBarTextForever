local ADDON_NAME, ns = ...
local L = ns.L

-- ==========================================
-- OPCIONES
-- ==========================================
-- Raiz "Acerca de" (UI/About.lua) y, colgando de ella, "General" con los
-- ajustes: panel propio con el mismo aspecto que RGB Cursor. Arriba se elige el
-- marco (jugador, objetivo, foco...) y debajo salen sus ajustes: interruptor y,
-- para la barra de vida y la de poder, valor y porcentaje con su posicion.

local HEADER = "|cffC47FF3"
local LOGO = "Interface\\AddOns\\HealthBarTextForever\\img\\logo_htf"
-- El logo a 16 px es una mancha marron: en las listas va esta version, con las barras ampliadas
local ICON = "Interface\\AddOns\\HealthBarTextForever\\img\\icon_htf"

local function AddTooltip(widget, text)
    widget:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(text, nil, nil, nil, nil, true)
        GameTooltip:Show()
    end)
    widget:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

local function SetDropdownEnabled(dropdown, on)
    if on then UIDropDownMenu_EnableDropDown(dropdown) else UIDropDownMenu_DisableDropDown(dropdown) end
end

-- Atenuado: SetEnabled (si es un control) + alpha 0.5
local function SetActive(region, on)
    if region.SetEnabled then region:SetEnabled(on) end
    region:SetAlpha(on and 1 or 0.5)
end

local function CreateGeneral()
    local panel = CreateFrame("Frame")
    panel:Hide()
    local x = 16
    local selected = "player" -- marco que se esta editando
    local refreshers = {}
    local function Refresh()
        for _, refresh in ipairs(refreshers) do refresh() end
    end
    local function Frame() return HealthBarTextForeverDB.frames[selected] end

    -- Desplegable que guarda su valor con set() y repinta el panel y las barras
    local function Dropdown(name, dx, y, width, keys, label, get, set, tooltip)
        local dropdown = CreateFrame("Frame", name, panel, "UIDropDownMenuTemplate")
        dropdown:SetPoint("TOPLEFT", dx, y)
        UIDropDownMenu_SetWidth(dropdown, width)
        AddTooltip(dropdown, tooltip)
        UIDropDownMenu_Initialize(dropdown, function()
            for _, key in ipairs(keys) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = label(key)
                info.value = key
                info.checked = get() == key
                info.func = function()
                    set(key)
                    Refresh()
                    ns.UpdateAll()
                end
                UIDropDownMenu_AddButton(info)
            end
        end)
        refreshers[#refreshers + 1] = function() UIDropDownMenu_SetText(dropdown, label(get())) end
        return dropdown
    end
    local function Checkbox(name, dx, y, text, tooltip, onClick)
        local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
        cb:SetPoint("TOPLEFT", dx, y)
        _G[cb:GetName() .. "Text"]:SetText(text)
        cb:SetScript("OnClick", function(self)
            onClick(self:GetChecked() and true or false)
            Refresh()
            ns.UpdateAll()
        end)
        AddTooltip(cb, tooltip)
        return cb
    end
    local function Label(dx, y, text, template)
        local fs = panel:CreateFontString(nil, "ARTWORK", template or "GameFontHighlight")
        fs:SetPoint("TOPLEFT", dx, y)
        fs:SetText(text)
        return fs
    end
    local function Line(y)
        local line = panel:CreateTexture(nil, "ARTWORK")
        line:SetColorTexture(1, 1, 1, 0.1)
        line:SetSize(580, 1)
        line:SetPoint("TOPLEFT", x, y)
    end

    Label(x, -16, L.OPTIONS_TITLE, "GameFontNormalLarge")

    local logo = panel:CreateTexture(nil, "ARTWORK")
    logo:SetSize(110, 110)
    logo:SetPoint("TOPRIGHT", -38, -5)
    logo:SetTexture(LOGO)

    local version = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    version:SetPoint("TOP", logo, "BOTTOM", 0, -2)
    version:SetText("v" .. (C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version") or "?"))

    Label(x, -56, HEADER .. L.GENERAL_HEADER .. "|r", "GameFontNormal")
    local power = Checkbox("HealthBarTextForever_ShowPowerCB", x, -81, L.SHOW_POWER, L.SHOW_POWER_TOOLTIP,
        function(on) HealthBarTextForeverDB.showPower = on end)
    refreshers[#refreshers + 1] = function() power:SetChecked(HealthBarTextForeverDB.showPower) end
    Line(-120)

    -- Marcos: se elige cual editar y debajo salen sus ajustes
    Label(x, -136, HEADER .. L.FRAMES_HEADER .. "|r", "GameFontNormal")
    Label(x, -166, L.EDIT_FRAME)
    Dropdown("HealthBarTextForever_Frame", x + 130, -158, 180, ns.FRAMES,
        function(unit) return L["FRAME_" .. unit:upper()] end,
        function() return selected end, function(unit) selected = unit end, L.EDIT_FRAME_TOOLTIP)

    local show = Checkbox("HealthBarTextForever_ShowFrame", x, -192, L.SHOW_FRAME, L.SHOW_FRAME_TOOLTIP,
        function(on) Frame().show = on end)
    local hover = Checkbox("HealthBarTextForever_HoverOnly", x + 20, -216, L.HOVER_ONLY, L.HOVER_ONLY_TOOLTIP,
        function(on) Frame().hover = on end)
    refreshers[#refreshers + 1] = function()
        show:SetChecked(Frame().show)
        hover:SetChecked(Frame().hover)
        SetActive(hover, Frame().show)
    end

    -- Una seccion por barra, sangrada: valor (estilo + posicion) y % (casilla + posicion)
    local POS_X = x + 340
    local function PositionLabel(pos) return L["POS_" .. pos] end
    local function BarSection(kind, title, y)
        local function Bar() return Frame()[kind] end
        local name = "HealthBarTextForever_" .. kind
        local header = Label(x + 20, y, title, "GameFontNormal")
        local posHeader = Label(POS_X + 18, y, L.POSITION, "GameFontHighlightSmall")
        local valueLabel = Label(x + 20, y - 26, L.VALUE)
        local value = Dropdown(name .. "_Value", x + 130, y - 18, 160, ns.VALUE_STYLES,
            function(key) return L["VALUE_" .. key] end,
            function() return Bar().value end, function(key) Bar().value = key end, L.VALUE_TOOLTIP)
        local valuePos = Dropdown(name .. "_ValuePos", POS_X, y - 18, 130, ns.POSITIONS, PositionLabel,
            function() return Bar().valuePos end, function(pos) Bar().valuePos = pos end, L.POSITION_TOOLTIP)
        local percent = Checkbox(name .. "_Percent", x + 16, y - 50, L.PERCENT, L.PERCENT_TOOLTIP,
            function(on) Bar().percent = on end)
        local percentPos = Dropdown(name .. "_PercentPos", POS_X, y - 50, 130, ns.POSITIONS, PositionLabel,
            function() return Bar().percentPos end, function(pos) Bar().percentPos = pos end, L.POSITION_TOOLTIP)

        -- Atenuado si el marco esta apagado (o, en el poder, las barras de poder);
        -- cada posicion, ademas, si su texto esta oculto
        refreshers[#refreshers + 1] = function()
            local on = Frame().show and (kind == "health" or HealthBarTextForeverDB.showPower)
            percent:SetChecked(Bar().percent)
            for _, region in ipairs({ header, posHeader, valueLabel, percent }) do SetActive(region, on) end
            SetDropdownEnabled(value, on)
            SetDropdownEnabled(valuePos, on and Bar().value ~= "NONE")
            SetDropdownEnabled(percentPos, on and Bar().percent)
        end
    end
    BarSection("health", L.HEALTH_BAR, -252)
    BarSection("power", L.POWER_BAR, -346)
    Line(-438)

    panel:SetScript("OnShow", Refresh)

    local reset = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    reset:SetSize(180, 26)
    reset:SetPoint("TOPLEFT", x, -456)
    reset:SetText(L.DEFAULTS)
    reset:SetScript("OnClick", function()
        HealthBarTextForeverDB.showPower = true
        for _, unit in ipairs(ns.FRAMES) do
            HealthBarTextForeverDB.frames[unit] = ns.DefaultFrame()
        end
        Refresh()
        ns.UpdateAll()
    end)

    return panel
end

function ns.CreateOptions()
    local root = ns.CreateAbout({
        name = "Health Bar Text Forever",
        listName = "Health Bar Text",
        logo = LOGO,
        icon = ICON,
        github = "https://github.com/Pirson-s-Addons/HealthBarTextForever",
        curseforge = "https://www.curseforge.com/wow/addons/health-bar-text-forever",
        commands = { { "/htf", L.CMD_OPEN } },
    })
    local general = Settings.RegisterCanvasLayoutSubcategory(root, CreateGeneral(), L.GENERAL)

    SLASH_HEALTHBARTEXTFOREVER1 = "/htf"
    SlashCmdList.HEALTHBARTEXTFOREVER = function() Settings.OpenToCategory(general:GetID()) end
end
