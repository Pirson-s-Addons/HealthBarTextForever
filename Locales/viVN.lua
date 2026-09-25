local ADDON_NAME, ns = ...

-- ==========================================
-- TIẾNG VIỆT (viVN)
-- ==========================================
local locale = GetLocale()
if locale ~= "viVN" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Tùy chọn Health Bar Text Forever"
L["GENERAL"] = "Chung"
L["GENERAL_HEADER"] = "Cài đặt chung"
L["DEFAULTS"] = "Giá trị mặc định"
L["VERSION"] = "Phiên bản:"
L["AUTHOR"] = "Tác giả:"
L["LINKS"] = "Liên kết"
L["COMMANDS"] = "Lệnh"
L["SELECT"] = "Chọn"
L["SELECT_TOOLTIP"] = "Chọn toàn bộ liên kết để bạn có thể sao chép bằng Ctrl+C. WoW không cho phép addon ghi vào bộ nhớ tạm, nên bước cuối là của bạn."
L["ABOUT_DESC"] = "Luôn hiện máu và năng lượng trên khung người chơi, mục tiêu, tiêu điểm và mục tiêu của mục tiêu. Chọn khung và định dạng của từng khung trong mục Chung."
L["CMD_OPEN"] = "Mở cài đặt."
L["MODE"] = "Chữ máu"
L["MODE_TOOLTIP"] = "Cách hiện máu và năng lượng trên khung này. Luôn hiển thị, không chỉ khi rê chuột."
L["SHOW_POWER"] = "Hiện trên thanh năng lượng"
L["SHOW_POWER_TOOLTIP"] = "Hiện chữ cả trên thanh mana, nộ, năng lượng... Khi tắt, các thanh đó trở lại cách hoạt động của Blizzard."
L["NUMERIC"] = "Giá trị (1.203 / 1.500)"
L["PERCENT"] = "Phần trăm (86%)"
L["SHORT"] = "Rút gọn (13K / 14K)"
L["BOTH"] = "Cả hai (86% 1.203 / 1.500)"
L["FRAMES_HEADER"] = "Khung"
L["FRAME_PLAYER"] = "Người chơi"
L["FRAME_TARGET"] = "Mục tiêu"
L["FRAME_TARGETTARGET"] = "Mục tiêu của mục tiêu"
L["FRAME_FOCUS"] = "Tiêu điểm"
L["FRAME_FOCUSTARGET"] = "Mục tiêu của tiêu điểm"
L["SHOW_FRAME_TOOLTIP"] = "Hiện chữ trên khung này. Khi tắt, khung trở lại cách hoạt động của Blizzard."
