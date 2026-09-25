local ADDON_NAME, ns = ...

-- ==========================================
-- TÜRKÇE (trTR)
-- ==========================================
local locale = GetLocale()
if locale ~= "trTR" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Health Bar Text Forever Seçenekleri"
L["GENERAL"] = "Genel"
L["GENERAL_HEADER"] = "Genel ayarlar"
L["DEFAULTS"] = "Varsayılan değerler"
L["VERSION"] = "Sürüm:"
L["AUTHOR"] = "Yazar:"
L["LINKS"] = "Bağlantılar"
L["COMMANDS"] = "Komutlar"
L["SELECT"] = "Seç"
L["SELECT_TOOLTIP"] = "Ctrl+C ile kopyalayabilmen için bağlantının tamamını seçer. WoW eklentilerin panoya yazmasına izin vermez, bu yüzden son adım sana kalıyor."
L["ABOUT_DESC"] = "Oyuncu, hedef, odak ve hedefin hedefi çerçevelerinde can ve gücü her zaman gösterir. Genel bölümünde hangi çerçeveleri ve her birinin biçimini seç."
L["CMD_OPEN"] = "Ayarları açar."
L["MODE"] = "Can metni"
L["MODE_TOOLTIP"] = "Bu çerçevede can ve gücün nasıl gösterileceği. Yalnızca fareyle üzerine gelince değil, her zaman görünür."
L["SHOW_POWER"] = "Güç çubuklarında göster"
L["SHOW_POWER_TOOLTIP"] = "Metni mana, öfke, enerji... çubuklarında da gösterir. Kapalıyken bu çubuklar Blizzard'ın davranışına döner."
L["NUMERIC"] = "Değer (1.203 / 1.500)"
L["PERCENT"] = "Yüzde (%86)"
L["SHORT"] = "Kısaltılmış (13B / 14B)"
L["BOTH"] = "İkisi (%86 1.203 / 1.500)"
L["FRAMES_HEADER"] = "Çerçeveler"
L["FRAME_PLAYER"] = "Oyuncu"
L["FRAME_TARGET"] = "Hedef"
L["FRAME_TARGETTARGET"] = "Hedefin hedefi"
L["FRAME_FOCUS"] = "Odak"
L["FRAME_FOCUSTARGET"] = "Odağın hedefi"
L["SHOW_FRAME_TOOLTIP"] = "Metni bu çerçevede gösterir. Kapalıyken çerçeve Blizzard'ın davranışına döner."
