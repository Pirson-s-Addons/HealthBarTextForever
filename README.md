<h1 align="center">Health Bar Text Forever</h1>

<p align="center">
  <b>Always-visible health and power text on the player, pet, target and focus frames for World of Warcraft: Forever</b>
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
<a href="README.es.md">🇪🇸 Español</a>
</p>

---

## 📸 Screenshots

<table>
<tr>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1956/350/healthbar-info-png.png" alt="Health and power text on the frames"><br><sub>Health and power text on the frames</sub></td>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1975/667/opcions-menu-health-text-forever-png.png" alt="Options"><br><sub>Options</sub></td>
</tr>
</table>

---

## What it does

By default, WoW Forever only shows your health and power numbers when you hover the bar. **Health Bar Text Forever** keeps them always visible on the **player**, **pet / minion**, **target**, **target of target**, **focus** and **target of focus** frames. For each frame and bar (health and power) you choose what is shown and where.

| Text | Example |
|---|---|
| **Value** | `1.203 / 1.500` |
| **Short value** | `13K / 14K` (`999 / 1K` below 1,000) |
| **Current value only** | `1.203` or `13K`, without the maximum |
| **Percent** | `86%` |

Value and percent each go where you want: **left**, **center** or **right** inside the bar, or **just outside it** on either side. Put them in the same spot and they share one line (`86% 1.203 / 1.500`); split them and they never overlap (`86%` on the left, `1.203 / 1.500` on the right).

## Features

- Always-visible health and power (mana, rage, energy...) on the player, pet / minion, target, target of target, focus and target of focus frames.
- Only on mouseover, per frame: hide the text until you hover the bar, keeping its format and position.
- Turn each frame on or off: an off frame goes back to Blizzard's default behavior.
- Per frame and per bar: value (full, short, current only or hidden), percent (on or off) and the position of each one: left, center, right, outside left or outside right.
- Optional text on the power bars (on by default). Turn it off and those bars go back to Blizzard's default behavior.
- The text hides with no unit or a dead one, so it never covers the game's own "Dead" label.
- Lightweight, no libraries. Settings live in the game's own **Options → AddOns** panel.

## Installation

1. Download the zip from the [latest release](https://github.com/Pirson-s-Addons/HealthBarTextForever/releases/latest).
2. Extract the `HealthBarTextForever` folder into `World of Warcraft/_forever_/Interface/AddOns/`.
3. Restart WoW and enable the addon.

It only loads on WoW Forever: the only TOC is `HealthBarTextForever_Camelot.toc` (`Camelot` is Forever's game type), so no other client lists it.

## Usage

- `/htf` opens the settings.
- **Options → AddOns → Health Bar Text Forever → General**: pick a frame, turn it on or off and set its health and power bars; plus "Show on power bars".

## Notes

In WoW Forever, health and power are **secret values** for addons during combat: they can be shown, but not used in math. This addon never computes anything with them: the percent comes from the game itself (`UnitHealthPercent` / `UnitPowerPercent`) and the numbers are only formatted for display.

---

**Author**: Pirson · [GitHub](https://github.com/Pirson-s-Addons) · [CurseForge](https://www.curseforge.com/members/pirson/projects) · MIT License
