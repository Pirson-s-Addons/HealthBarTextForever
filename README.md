<h1 align="center">Health Bar Text Forever</h1>

<p align="center">
  <b>Always-visible health and power text on the player, target and focus frames for World of Warcraft: Forever</b>
</p>

<p align="center">
<a href="https://github.com/Pirson-s-Addons/HealthBarTextForever/releases/latest">
<img src="https://img.shields.io/github/v/release/Pirson-s-Addons/HealthBarTextForever?style=for-the-badge&color=A78BFA">
</a>
<img src="https://img.shields.io/badge/WoW_Forever-1.60.1-C4B5FD?style=for-the-badge">
<a href="LICENSE">
<img src="https://img.shields.io/badge/License-MIT-E9D5FF?style=for-the-badge">
</a>
</p>

<p align="center">
<a href="#-español">🇪🇸 Español</a>
</p>

---

## What it does

By default, WoW Forever only shows your health and power numbers when you hover the bar. **Health Bar Text Forever** keeps them always visible on the **player**, **target**, **target of target**, **focus** and **target of focus** frames, in the format you choose for each one.

| Format | Example |
|---|---|
| **Value** | `1.203 / 1.500` |
| **Percent** | `86%` |
| **Short** | `13K / 14K` (`999 / 1K` below 1,000) |
| **Both** | `86% 1.203 / 1.500` |

## Features

- Always-visible health and power (mana, rage, energy...) on the player, target, target of target, focus and target of focus frames.
- Turn each frame on or off: an off frame goes back to Blizzard's default behavior.
- Four formats, chosen per frame: value, percent, short or both.
- Optional text on the power bars (on by default). Turn it off and those bars go back to Blizzard's default behavior.
- The text hides with no unit or a dead one, so it never covers the game's own "Dead" label.
- Lightweight, no libraries. Settings live in the game's own **Options → AddOns** panel.

## Installation

1. Download the zip from the [latest release](https://github.com/Pirson-s-Addons/HealthBarTextForever/releases/latest).
2. Extract the `HealthBarTextForever` folder into `World of Warcraft/_classic_beta_/Interface/AddOns/`.
3. Restart WoW and enable the addon.

It only loads on WoW Forever: the only TOC is `HealthBarTextForever_Camelot.toc` (`Camelot` is Forever's game type), so no other client lists it.

## Usage

- `/htf` opens the settings.
- **Options → AddOns → Health Bar Text Forever → General**: which frames show the text, the format of each one and "Show on power bars".

## Notes

In WoW Forever, health and power are **secret values** for addons during combat: they can be shown, but not used in math. This addon never computes anything with them: the percent comes from the game itself (`UnitHealthPercent` / `UnitPowerPercent`) and the numbers are only formatted for display.

---

## 🇪🇸 Español

Por defecto, WoW Forever solo muestra los números de vida y poder al pasar el ratón por la barra. **Health Bar Text Forever** los mantiene siempre visibles en los marcos del **jugador**, el **objetivo**, el **objetivo del objetivo**, el **foco** y el **objetivo del foco**, en el formato que elijas para cada uno.

| Formato | Ejemplo |
|---|---|
| **Valor** | `1.203 / 1.500` |
| **Porcentaje** | `86%` |
| **Abreviado** | `13mil / 14mil` (`999 / 1mil` por debajo de 1.000) |
| **Ambos** | `86% 1.203 / 1.500` |

### Funciones

- Vida y poder (maná, ira, energía...) siempre visibles en los marcos del jugador, el objetivo, el objetivo del objetivo, el foco y el objetivo del foco.
- Cada marco se activa o desactiva por separado: desactivado, vuelve al comportamiento de Blizzard.
- Cuatro formatos, a elegir por marco: valor, porcentaje, abreviado o ambos.
- Texto opcional en las barras de poder (activado por defecto). Si lo desactivas, esas barras vuelven al comportamiento de Blizzard.
- El texto se oculta cuando no hay unidad o está muerta, así nunca tapa el "Muerto" del propio juego.
- Ligero, sin librerías. Los ajustes están en el panel del propio juego: **Opciones → AddOns**.

### Instalación

1. Descarga el zip de la [última release](https://github.com/Pirson-s-Addons/HealthBarTextForever/releases/latest).
2. Extrae la carpeta `HealthBarTextForever` en `World of Warcraft/_classic_beta_/Interface/AddOns/`.
3. Reinicia el juego y activa el addon.

Solo se carga en WoW Forever: su único `.toc` es `HealthBarTextForever_Camelot.toc` (`Camelot` es el game type de Forever), así que ningún otro cliente lo muestra.

### Uso

- `/htf` abre los ajustes.
- **Opciones → AddOns → Health Bar Text Forever → General**: en qué marcos se ve el texto, el formato de cada uno y "Mostrar en las barras de poder".

### Notas

En WoW Forever la vida y el poder son **valores secretos** para los addons en combate: se pueden mostrar, pero no usar en cálculos. Este addon no hace ninguna cuenta con ellos: el porcentaje lo da el propio juego (`UnitHealthPercent` / `UnitPowerPercent`) y los números solo se formatean para mostrarlos.

---

**Author**: Pirson · [GitHub](https://github.com/Pirson-s-Addons) · [CurseForge](https://www.curseforge.com/members/pirson/projects) · MIT License
