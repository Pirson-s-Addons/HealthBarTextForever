local ADDON_NAME, ns = ...

-- ==========================================
-- العربية (arSA)
-- ==========================================
local locale = GetLocale()
if locale ~= "arSA" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "خيارات Health Bar Text Forever"
L["GENERAL"] = "عام"
L["GENERAL_HEADER"] = "الإعدادات العامة"
L["DEFAULTS"] = "القيم الافتراضية"
L["VERSION"] = "الإصدار:"
L["AUTHOR"] = "المؤلف:"
L["LINKS"] = "روابط"
L["COMMANDS"] = "الأوامر"
L["SELECT"] = "تحديد"
L["SELECT_TOOLTIP"] = "يحدد الرابط كاملاً لتتمكن من نسخه باستخدام Ctrl+C. لا تسمح WoW للإضافات بالكتابة في الحافظة، لذا الخطوة الأخيرة عليك."
L["ABOUT_DESC"] = "يعرض الصحة والطاقة دائمًا على إطارات اللاعب والهدف والتركيز وهدف الهدف، وليس فقط عند تمرير الفأرة. اختر في قسم عام الإطارات وتنسيق كل منها."
L["CMD_OPEN"] = "يفتح الإعدادات."
L["MODE"] = "نص الصحة"
L["MODE_TOOLTIP"] = "طريقة عرض الصحة والطاقة على هذا الإطار. ظاهرة دائمًا، وليس فقط عند تمرير الفأرة."
L["SHOW_POWER"] = "العرض على أشرطة الطاقة"
L["SHOW_POWER_TOOLTIP"] = "يعرض النص أيضًا على أشرطة المانا والغضب والطاقة... عند إيقافه تعود هذه الأشرطة إلى سلوك Blizzard."
L["NUMERIC"] = "القيمة (1,203 / 1,500)"
L["PERCENT"] = "النسبة (86%)"
L["SHORT"] = "مختصر (13K / 14K)"
L["BOTH"] = "كلاهما (86% 1,203 / 1,500)"
L["FRAMES_HEADER"] = "الإطارات"
L["FRAME_PLAYER"] = "اللاعب"
L["FRAME_TARGET"] = "الهدف"
L["FRAME_TARGETTARGET"] = "هدف الهدف"
L["FRAME_FOCUS"] = "التركيز"
L["FRAME_FOCUSTARGET"] = "هدف التركيز"
L["SHOW_FRAME_TOOLTIP"] = "يعرض النص على هذا الإطار. عند إيقافه يعود الإطار إلى سلوك Blizzard."
