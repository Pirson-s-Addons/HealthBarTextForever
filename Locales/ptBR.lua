local ADDON_NAME, ns = ...

-- ==========================================
-- PORTUGUÊS (ptBR)
-- ==========================================
local locale = GetLocale()
if locale ~= "ptBR" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Opções do Health Bar Text Forever"
L["GENERAL"] = "Geral"
L["GENERAL_HEADER"] = "Configurações gerais"
L["DEFAULTS"] = "Valores padrão"
L["VERSION"] = "Versão:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Links"
L["COMMANDS"] = "Comandos"
L["SELECT"] = "Selecionar"
L["SELECT_TOOLTIP"] = "Seleciona o link inteiro para você copiá-lo com Ctrl+C. O WoW não deixa addons escreverem na área de transferência, então o último passo é seu."
L["ABOUT_DESC"] = "Mostra sempre a vida e o poder nos quadros do jogador, do alvo, do foco e do alvo do alvo, não só ao passar o mouse. Em Geral você escolhe os quadros e o formato de cada um."
L["CMD_OPEN"] = "Abre as configurações."
L["MODE"] = "Texto de vida"
L["MODE_TOOLTIP"] = "Como a vida e o poder aparecem neste quadro. Sempre visível, não só ao passar o mouse."
L["SHOW_POWER"] = "Mostrar nas barras de poder"
L["SHOW_POWER_TOOLTIP"] = "Mostra o texto também nas barras de mana, raiva, energia... Desativado, essas barras voltam ao comportamento da Blizzard."
L["NUMERIC"] = "Valor (1.203 / 1.500)"
L["PERCENT"] = "Porcentagem (86%)"
L["SHORT"] = "Abreviado (13 mil / 14 mil)"
L["BOTH"] = "Ambos (86% 1.203 / 1.500)"
L["FRAMES_HEADER"] = "Quadros"
L["FRAME_PLAYER"] = "Jogador"
L["FRAME_TARGET"] = "Alvo"
L["FRAME_TARGETTARGET"] = "Alvo do alvo"
L["FRAME_FOCUS"] = "Foco"
L["FRAME_FOCUSTARGET"] = "Alvo do foco"
L["SHOW_FRAME_TOOLTIP"] = "Mostra o texto neste quadro. Desativado, o quadro volta ao comportamento da Blizzard."
