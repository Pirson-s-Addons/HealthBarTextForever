local ADDON_NAME, ns = ...

-- ==========================================
-- 한국어 (koKR)
-- ==========================================
local locale = GetLocale()
if locale ~= "koKR" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Health Bar Text Forever 설정"
L["GENERAL"] = "일반"
L["GENERAL_HEADER"] = "일반 설정"
L["DEFAULTS"] = "기본값"
L["VERSION"] = "버전:"
L["AUTHOR"] = "제작자:"
L["LINKS"] = "링크"
L["COMMANDS"] = "명령어"
L["SELECT"] = "선택"
L["SELECT_TOOLTIP"] = "Ctrl+C로 복사할 수 있도록 링크 전체를 선택합니다. WoW는 애드온이 클립보드에 쓰는 것을 허용하지 않으므로 마지막 단계는 직접 해야 합니다."
L["ABOUT_DESC"] = "플레이어, 대상, 주시 대상, 대상의 대상 프레임에 생명력과 자원을 항상 표시합니다. 일반에서 표시할 프레임과 각 형식을 선택하세요."
L["CMD_OPEN"] = "설정을 엽니다."
L["MODE"] = "생명력 문자"
L["MODE_TOOLTIP"] = "이 프레임에 생명력과 자원을 표시하는 방식. 마우스를 올릴 때만이 아니라 항상 표시됩니다."
L["SHOW_POWER"] = "자원 바에 표시"
L["SHOW_POWER_TOOLTIP"] = "마나, 분노, 기력... 바에도 문자를 표시합니다. 끄면 해당 바는 블리자드 기본 동작으로 돌아갑니다."
L["NUMERIC"] = "수치 (1,203 / 1,500)"
L["PERCENT"] = "백분율 (86%)"
L["SHORT"] = "축약 (1.3만 / 1.4만)"
L["BOTH"] = "둘 다 (86% 1,203 / 1,500)"
L["FRAMES_HEADER"] = "프레임"
L["FRAME_PLAYER"] = "플레이어"
L["FRAME_TARGET"] = "대상"
L["FRAME_TARGETTARGET"] = "대상의 대상"
L["FRAME_FOCUS"] = "주시 대상"
L["FRAME_FOCUSTARGET"] = "주시 대상의 대상"
L["SHOW_FRAME_TOOLTIP"] = "이 프레임에 문자를 표시합니다. 끄면 블리자드 기본 동작으로 돌아갑니다."
