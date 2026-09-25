local ADDON_NAME, ns = ...

-- ==========================================
-- 简体中文 (zhCN)
-- ==========================================
local locale = GetLocale()
if locale ~= "zhCN" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Health Bar Text Forever 选项"
L["GENERAL"] = "常规"
L["GENERAL_HEADER"] = "常规设置"
L["DEFAULTS"] = "默认值"
L["VERSION"] = "版本："
L["AUTHOR"] = "作者："
L["LINKS"] = "链接"
L["COMMANDS"] = "命令"
L["SELECT"] = "选择"
L["SELECT_TOOLTIP"] = "选中整个链接，以便你用 Ctrl+C 复制。WoW 不允许插件写入剪贴板，所以最后一步需要你自己完成。"
L["ABOUT_DESC"] = "在玩家、目标、焦点和目标的目标框体上始终显示生命值和能量，而不只是鼠标悬停时。在“常规”中选择显示的框体及各自的格式。"
L["CMD_OPEN"] = "打开设置。"
L["MODE"] = "生命值文字"
L["MODE_TOOLTIP"] = "此框体上生命值和能量的显示方式。始终可见，而不只是鼠标悬停时。"
L["SHOW_POWER"] = "在能量条上显示"
L["SHOW_POWER_TOOLTIP"] = "在法力、怒气、能量……条上也显示文字。关闭后，这些条恢复暴雪的默认行为。"
L["NUMERIC"] = "数值 (1,203 / 1,500)"
L["PERCENT"] = "百分比 (86%)"
L["SHORT"] = "缩写 (1.3万 / 1.4万)"
L["BOTH"] = "两者 (86% 1,203 / 1,500)"
L["FRAMES_HEADER"] = "框体"
L["FRAME_PLAYER"] = "玩家"
L["FRAME_TARGET"] = "目标"
L["FRAME_TARGETTARGET"] = "目标的目标"
L["FRAME_FOCUS"] = "焦点"
L["FRAME_FOCUSTARGET"] = "焦点的目标"
L["SHOW_FRAME_TOOLTIP"] = "在此框体上显示文字。关闭后，该框体恢复暴雪的默认行为。"
