<p align="center"><a href="https://www.curseforge.com/wow/addons/health-bar-text-forever"><img src="https://raw.githubusercontent.com/Pirson-s-Addons/.github/main/profile/assets/readme-hb-es.svg" width="100%" alt="Health Bar Text Forever"/></a></p>

<p align="center"><a href="README.md">English</a> · <b>Español</b></p>

<p align="center">
<a href="https://www.curseforge.com/wow/addons/health-bar-text-forever"><b>CurseForge</b></a> ·
<a href="https://github.com/Pirson-s-Addons/HealthBarTextForever/releases/latest"><b>Descargar</b></a>
</p>

## Capturas

<table>
<tr>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/2243/991/vida-barra-png.png" alt="Vida y poder, siempre a la vista"><br><sub>Vida y poder, siempre a la vista</sub></td>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/2243/990/menu-vida1-png.png" alt="Elige cómo se ve cada número"><br><sub>Elige cómo se ve cada número</sub></td>
</tr>
<tr>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/2243/989/menu-vida2-png.png" alt="Cada marco, con sus propios ajustes"><br><sub>Cada marco, con sus propios ajustes</sub></td>
</tr>
</table>

## Qué hace

Por defecto, WoW Forever solo muestra los números de vida y poder al pasar el ratón por la barra. **Health Bar Text Forever** los mantiene siempre visibles en los marcos del **jugador**, la **mascota / esbirro**, el **objetivo**, el **objetivo del objetivo**, el **foco** y el **objetivo del foco**. Para cada marco y barra (vida y poder) eliges qué se muestra y dónde.

| Texto | Ejemplo |
|---|---|
| **Valor** | `1.203 / 1.500` |
| **Valor abreviado** | `13mil / 14mil` (`999 / 1mil` por debajo de 1.000) |
| **Solo el valor actual** | `1.203` o `13mil`, sin el máximo |
| **Porcentaje** | `86%` |

El valor y el porcentaje van cada uno donde quieras: **izquierda**, **centro** o **derecha** dentro de la barra, o **justo fuera** de ella por cualquiera de los dos lados. En el mismo sitio comparten línea (`86% 1.203 / 1.500`); separados nunca se pisan (`86%` a la izquierda, `1.203 / 1.500` a la derecha).

## Funciones

- Vida y poder (maná, ira, energía...) siempre visibles en los marcos del jugador, la mascota / esbirro, el objetivo, el objetivo del objetivo, el foco y el objetivo del foco.
- Solo al pasar el ratón, por marco: oculta el texto hasta que pases por la barra, con su formato y posición.
- Cada marco se activa o desactiva por separado: desactivado, vuelve al comportamiento de Blizzard.
- Por marco y por barra: valor (completo, abreviado, solo el actual u oculto), porcentaje (sí o no) y la posición de cada uno: izquierda, centro, derecha, fuera a la izquierda o fuera a la derecha.
- Texto opcional en las barras de poder (activado por defecto). Si lo desactivas, esas barras vuelven al comportamiento de Blizzard.
- El texto se oculta cuando no hay unidad o está muerta, así nunca tapa el "Muerto" del propio juego.
- Ligero, sin librerías. Los ajustes están en el panel del propio juego: **Opciones → AddOns**.

## Uso

- `/htf` abre los ajustes.
- **Opciones → AddOns → Health Bar Text Forever → General**: eliges un marco, lo activas o desactivas y configuras sus barras de vida y de poder; además, "Mostrar en las barras de poder".

## Instalación

1. Descarga el zip de la [última release](https://github.com/Pirson-s-Addons/HealthBarTextForever/releases/latest).
2. Extrae la carpeta `HealthBarTextForever` en `World of Warcraft/_forever_/Interface/AddOns/`.
3. Reinicia el juego y activa el addon.

Solo se carga en WoW Forever: su único `.toc` es `HealthBarTextForever_Camelot.toc` (`Camelot` es el game type de Forever), así que ningún otro cliente lo muestra.

## Notas

En WoW Forever la vida y el poder son **valores secretos** para los addons en combate: se pueden mostrar, pero no usar en cálculos. Este addon no hace ninguna cuenta con ellos: el porcentaje lo da el propio juego (`UnitHealthPercent` / `UnitPowerPercent`) y los números solo se formatean para mostrarlos.

**Autor**: Pirson · [GitHub](https://github.com/Pirson-s-Addons) · [CurseForge](https://www.curseforge.com/members/pirson/projects) · Licencia MIT

<br/>

<p align="center"><a href="https://github.com/Pirson-s-Addons"><img src="https://raw.githubusercontent.com/Pirson-s-Addons/.github/main/profile/assets/readme-footer-es.svg" width="100%" alt="Parte de Pirson's Addons. Ver todos los addons."/></a></p>
