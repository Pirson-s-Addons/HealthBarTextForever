<h1 align="center">Health Bar Text Forever</h1>

<p align="center">
  <b>Texto de vida y poder siempre visible en los marcos del jugador, la mascota, el objetivo y el foco para World of Warcraft: Forever</b>
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
<a href="README.md">🇬🇧 English</a>
</p>

---

## 📸 Capturas

<table>
<tr>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1956/350/healthbar-info-png.png" alt="Health and power text on the frames"><br><sub>Texto de vida y poder en los marcos</sub></td>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1975/667/opcions-menu-health-text-forever-png.png" alt="Options"><br><sub>Opciones</sub></td>
</tr>
</table>

---

## Qué hace

Por defecto, WoW Forever solo muestra los números de vida y poder al pasar el ratón por la barra. **Health Bar Text Forever** los mantiene siempre visibles en los marcos del **jugador**, la **mascota / esbirro**, el **objetivo**, el **objetivo del objetivo**, el **foco** y el **objetivo del foco**, en el formato que elijas para cada uno.

| Formato | Ejemplo |
|---|---|
| **Valor** | `1.203 / 1.500` |
| **Porcentaje** | `86%` |
| **Abreviado** | `13mil / 14mil` (`999 / 1mil` por debajo de 1.000) |
| **Ambos** | `86% 1.203 / 1.500` |

## Funciones

- Vida y poder (maná, ira, energía...) siempre visibles en los marcos del jugador, la mascota / esbirro, el objetivo, el objetivo del objetivo, el foco y el objetivo del foco.
- Cada marco se activa o desactiva por separado: desactivado, vuelve al comportamiento de Blizzard.
- Cuatro formatos, a elegir por marco: valor, porcentaje, abreviado o ambos.
- Texto opcional en las barras de poder (activado por defecto). Si lo desactivas, esas barras vuelven al comportamiento de Blizzard.
- El texto se oculta cuando no hay unidad o está muerta, así nunca tapa el "Muerto" del propio juego.
- Ligero, sin librerías. Los ajustes están en el panel del propio juego: **Opciones → AddOns**.

## Instalación

1. Descarga el zip de la [última release](https://github.com/Pirson-s-Addons/HealthBarTextForever/releases/latest).
2. Extrae la carpeta `HealthBarTextForever` en `World of Warcraft/_classic_beta_/Interface/AddOns/`.
3. Reinicia el juego y activa el addon.

Solo se carga en WoW Forever: su único `.toc` es `HealthBarTextForever_Camelot.toc` (`Camelot` es el game type de Forever), así que ningún otro cliente lo muestra.

## Uso

- `/htf` abre los ajustes.
- **Opciones → AddOns → Health Bar Text Forever → General**: en qué marcos se ve el texto, el formato de cada uno y "Mostrar en las barras de poder".

## Notas

En WoW Forever la vida y el poder son **valores secretos** para los addons en combate: se pueden mostrar, pero no usar en cálculos. Este addon no hace ninguna cuenta con ellos: el porcentaje lo da el propio juego (`UnitHealthPercent` / `UnitPowerPercent`) y los números solo se formatean para mostrarlos.

---

**Autor**: Pirson · [GitHub](https://github.com/Pirson-s-Addons) · [CurseForge](https://www.curseforge.com/members/pirson/projects) · Licencia MIT
