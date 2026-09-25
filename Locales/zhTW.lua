local ADDON_NAME, ns = ...

-- ==========================================
-- 繁體中文 (zhTW)
-- ==========================================
local locale = GetLocale()
if locale ~= "zhTW" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Health Bar Text Forever 選項"
L["GENERAL"] = "一般"
L["GENERAL_HEADER"] = "一般設定"
L["DEFAULTS"] = "預設值"
L["VERSION"] = "版本："
L["AUTHOR"] = "作者："
L["LINKS"] = "連結"
L["COMMANDS"] = "指令"
L["SELECT"] = "選取"
L["SELECT_TOOLTIP"] = "選取整個連結，讓你可以用 Ctrl+C 複製。WoW 不允許插件寫入剪貼簿，所以最後一步要由你完成。"
L["ABOUT_DESC"] = "在玩家、目標、專注目標和目標的目標框架上始終顯示生命值和能量，而不只是滑鼠懸停時。在「一般」中選擇顯示的框架及各自的格式。"
L["CMD_OPEN"] = "開啟設定。"
L["MODE"] = "生命值文字"
L["MODE_TOOLTIP"] = "此框架上生命值和能量的顯示方式。始終可見，而不只是滑鼠懸停時。"
L["SHOW_POWER"] = "在能量條上顯示"
L["SHOW_POWER_TOOLTIP"] = "在法力、怒氣、能量……條上也顯示文字。關閉後，這些條恢復暴雪的預設行為。"
L["NUMERIC"] = "數值 (1,203 / 1,500)"
L["PERCENT"] = "百分比 (86%)"
L["SHORT"] = "縮寫 (1.3萬 / 1.4萬)"
L["BOTH"] = "兩者 (86% 1,203 / 1,500)"
L["FRAMES_HEADER"] = "框架"
L["FRAME_PLAYER"] = "玩家"
L["FRAME_TARGET"] = "目標"
L["FRAME_TARGETTARGET"] = "目標的目標"
L["FRAME_FOCUS"] = "專注目標"
L["FRAME_FOCUSTARGET"] = "專注目標的目標"
L["SHOW_FRAME_TOOLTIP"] = "在此框架上顯示文字。關閉後，該框架恢復暴雪的預設行為。"
