local ADDON_NAME, ns = ...
local L = ns.L

-- ==========================================
-- OPCIONES
-- ==========================================
-- Raiz "Acerca de" (UI/About.lua) y, colgando de ella, "General" con los
-- ajustes: panel propio con el mismo aspecto que RGB Cursor. Cada marco
-- (jugador, objetivo, foco...) se activa y lleva su formato por separado.

local MODES = { "NUMERIC", "PERCENT", "SHORT", "BOTH" }
local HEADER = "|cffC47FF3"
local LOGO = "Interface\\AddOns\\HealthBarTextForever\\img\\logo_htf"

local function AddTooltip(widget, text)
    widget:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(text, nil, nil, nil, nil, true)
        GameTooltip:Show()
    end)
    widget:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

local function CreateGeneral()
    local panel = CreateFrame("Frame")
    panel:Hide()
    local x = 16

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", x, -16)
    title:SetText(L.OPTIONS_TITLE)

    local logo = panel:CreateTexture(nil, "ARTWORK")
    logo:SetSize(110, 110)
    logo:SetPoint("TOPRIGHT", -38, -5)
    logo:SetTexture(LOGO)

    local version = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    version:SetPoint("TOP", logo, "BOTTOM", 0, -2)
    version:SetText("v" .. (C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version") or "?"))

    local header = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    header:SetPoint("TOPLEFT", x, -56)
    header:SetText(HEADER .. L.GENERAL_HEADER .. "|r")

    local power = CreateFrame("CheckButton", "HealthBarTextForever_ShowPowerCB", panel, "InterfaceOptionsCheckButtonTemplate")
    power:SetPoint("TOPLEFT", x, -81)
    _G[power:GetName() .. "Text"]:SetText(L.SHOW_POWER)
    power:SetScript("OnClick", function(self)
        HealthBarTextForeverDB.showPower = self:GetChecked()
        ns.UpdateAll()
    end)
    AddTooltip(power, L.SHOW_POWER_TOOLTIP)

    local line = panel:CreateTexture(nil, "ARTWORK")
    line:SetColorTexture(1, 1, 1, 0.1)
    line:SetSize(580, 1)
    line:SetPoint("TOPLEFT", x, -120)

    -- Marcos: una fila por marco con su interruptor y su formato
    local framesHeader = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    framesHeader:SetPoint("TOPLEFT", x, -136)
    framesHeader:SetText(HEADER .. L.FRAMES_HEADER .. "|r")

    local modeLabel = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    modeLabel:SetPoint("TOPLEFT", x + 250, -140)
    modeLabel:SetText(L.MODE)

    local rows = {}
    for i, unit in ipairs(ns.FRAMES) do
        local y = -161 - (i - 1) * 40
        local settings = function() return HealthBarTextForeverDB.frames[unit] end

        local dropdown = CreateFrame("Frame", "HealthBarTextForever_Mode_" .. unit, panel, "UIDropDownMenuTemplate")
        dropdown:SetPoint("TOPLEFT", x + 235, y + 1)
        UIDropDownMenu_SetWidth(dropdown, 220)
        AddTooltip(dropdown, L.MODE_TOOLTIP)
        UIDropDownMenu_Initialize(dropdown, function()
            for _, key in ipairs(MODES) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = L[key]
                info.value = key
                info.checked = settings().mode == key
                info.func = function()
                    settings().mode = key
                    UIDropDownMenu_SetText(dropdown, L[key])
                    ns.UpdateAll()
                end
                UIDropDownMenu_AddButton(info)
            end
        end)

        -- Apagado, el marco vuelve a lo de Blizzard y su formato no aplica
        local function SetDropdownEnabled(on)
            if on then UIDropDownMenu_EnableDropDown(dropdown) else UIDropDownMenu_DisableDropDown(dropdown) end
        end

        local show = CreateFrame("CheckButton", "HealthBarTextForever_Show_" .. unit, panel, "InterfaceOptionsCheckButtonTemplate")
        show:SetPoint("TOPLEFT", x, y)
        _G[show:GetName() .. "Text"]:SetText(L["FRAME_" .. unit:upper()])
        show:SetScript("OnClick", function(self)
            settings().show = self:GetChecked() and true or false
            SetDropdownEnabled(settings().show)
            ns.UpdateAll()
        end)
        AddTooltip(show, L.SHOW_FRAME_TOOLTIP)

        rows[#rows + 1] = function()
            show:SetChecked(settings().show)
            UIDropDownMenu_SetText(dropdown, L[settings().mode])
            SetDropdownEnabled(settings().show)
        end
    end

    local bottom = -161 - #ns.FRAMES * 40
    local line2 = panel:CreateTexture(nil, "ARTWORK")
    line2:SetColorTexture(1, 1, 1, 0.1)
    line2:SetSize(580, 1)
    line2:SetPoint("TOPLEFT", x, bottom - 4)

    local function Refresh()
        power:SetChecked(HealthBarTextForeverDB.showPower)
        for _, refreshRow in ipairs(rows) do refreshRow() end
    end
    panel:SetScript("OnShow", Refresh)

    local reset = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    reset:SetSize(180, 26)
    reset:SetPoint("TOPLEFT", x, bottom - 24)
    reset:SetText(L.DEFAULTS)
    reset:SetScript("OnClick", function()
        HealthBarTextForeverDB.showPower = true
        for _, unit in ipairs(ns.FRAMES) do
            HealthBarTextForeverDB.frames[unit] = { show = true, mode = ns.DEFAULT_MODE }
        end
        Refresh()
        ns.UpdateAll()
    end)

    return panel
end

function ns.CreateOptions()
    local root = ns.CreateAbout({
        name = "Health Bar Text Forever",
        logo = LOGO,
        github = "https://github.com/Pirson-s-Addons/HealthBarTextForever",
        curseforge = "https://www.curseforge.com/wow/addons/health-text-forever",
        commands = { { "/htf", L.CMD_OPEN } },
    })
    local general = Settings.RegisterCanvasLayoutSubcategory(root, CreateGeneral(), L.GENERAL)

    SLASH_HEALTHBARTEXTFOREVER1 = "/htf"
    SlashCmdList.HEALTHBARTEXTFOREVER = function() Settings.OpenToCategory(general:GetID()) end
end
