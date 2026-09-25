local ADDON_NAME, ns = ...

-- ==========================================
-- 日本語 (jaJP)
-- ==========================================
local locale = GetLocale()
if locale ~= "jaJP" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Health Bar Text Forever オプション"
L["GENERAL"] = "一般"
L["GENERAL_HEADER"] = "一般設定"
L["DEFAULTS"] = "デフォルト値"
L["VERSION"] = "バージョン："
L["AUTHOR"] = "作者："
L["LINKS"] = "リンク"
L["COMMANDS"] = "コマンド"
L["SELECT"] = "選択"
L["SELECT_TOOLTIP"] = "Ctrl+Cでコピーできるようにリンク全体を選択します。WoWはアドオンがクリップボードに書き込むことを許可していないため、最後の手順はご自身で行ってください。"
L["ABOUT_DESC"] = "プレイヤー、ターゲット、フォーカス、ターゲットのターゲットのフレームに体力とパワーを常に表示します。「一般」で表示するフレームとそれぞれの形式を選びます。"
L["CMD_OPEN"] = "設定を開きます。"
L["MODE"] = "体力テキスト"
L["MODE_TOOLTIP"] = "このフレームでの体力とパワーの表示方法。マウスを乗せたときだけでなく常に表示されます。"
L["SHOW_POWER"] = "パワーバーに表示"
L["SHOW_POWER_TOOLTIP"] = "マナ、怒り、エネルギー…のバーにもテキストを表示します。オフにすると、それらのバーはBlizzard標準の動作に戻ります。"
L["NUMERIC"] = "数値 (1,203 / 1,500)"
L["PERCENT"] = "パーセント (86%)"
L["SHORT"] = "短縮 (1.3万 / 1.4万)"
L["BOTH"] = "両方 (86% 1,203 / 1,500)"
L["FRAMES_HEADER"] = "フレーム"
L["FRAME_PLAYER"] = "プレイヤー"
L["FRAME_TARGET"] = "ターゲット"
L["FRAME_TARGETTARGET"] = "ターゲットのターゲット"
L["FRAME_FOCUS"] = "フォーカス"
L["FRAME_FOCUSTARGET"] = "フォーカスのターゲット"
L["SHOW_FRAME_TOOLTIP"] = "このフレームにテキストを表示します。オフにすると、このフレームはBlizzard標準の動作に戻ります。"
