local ADDON_NAME, ns = ...

-- ==========================================
-- FRANÇAIS (frFR)
-- ==========================================
local locale = GetLocale()
if locale ~= "frFR" then return end
local L = ns.L

L["OPTIONS_TITLE"] = "Options de Health Bar Text Forever"
L["GENERAL"] = "Général"
L["GENERAL_HEADER"] = "Réglages généraux"
L["DEFAULTS"] = "Valeurs par défaut"
L["VERSION"] = "Version :"
L["AUTHOR"] = "Auteur :"
L["LINKS"] = "Liens"
L["COMMANDS"] = "Commandes"
L["SELECT"] = "Sélectionner"
L["SELECT_TOOLTIP"] = "Sélectionne le lien entier pour que tu puisses le copier avec Ctrl+C. WoW ne laisse pas les addons écrire dans le presse-papiers, la dernière étape est donc pour toi."
L["ABOUT_DESC"] = "Affiche toujours la vie et la puissance sur les cadres du joueur, de la cible, de la focalisation et de la cible de la cible, pas seulement au survol. Choisissez dans Général les cadres et le format de chacun."
L["CMD_OPEN"] = "Ouvre les réglages."
L["MODE"] = "Texte de vie"
L["MODE_TOOLTIP"] = "Comment la vie et la puissance sont affichées sur ce cadre. Toujours visible, pas seulement au survol."
L["SHOW_POWER"] = "Afficher sur les barres de puissance"
L["SHOW_POWER_TOOLTIP"] = "Affiche aussi le texte sur les barres de mana, rage, énergie... Désactivé, ces barres reprennent le comportement de Blizzard."
L["NUMERIC"] = "Valeur (1 203 / 1 500)"
L["PERCENT"] = "Pourcentage (86 %)"
L["SHORT"] = "Abrégé (13k / 14k)"
L["BOTH"] = "Les deux (86 % 1 203 / 1 500)"
L["FRAMES_HEADER"] = "Cadres"
L["FRAME_PLAYER"] = "Joueur"
L["FRAME_TARGET"] = "Cible"
L["FRAME_TARGETTARGET"] = "Cible de la cible"
L["FRAME_FOCUS"] = "Focalisation"
L["FRAME_FOCUSTARGET"] = "Cible de la focalisation"
L["SHOW_FRAME_TOOLTIP"] = "Affiche le texte sur ce cadre. Désactivé, le cadre reprend le comportement de Blizzard."
