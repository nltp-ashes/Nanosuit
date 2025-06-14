# Nanosuit [![License](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

[![Latest Stable Build](https://img.shields.io/github/v/release/nltp-ashes/Nanosuit?label=Latest%20Stable%20Build&color=brightgreen)](https://github.com/nltp-ashes/Nanosuit/releases/latest) [![Latest Test Build](https://img.shields.io/github/v/release/nltp-ashes/Nanosuit?include_prereleases&filter=*rc*&display_name=tag&label=Latest%20Test%20Build&color=yellow)]() [![Total Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/total.svg?label=Downloads%20(All%20Time))](https://github.com/nltp-ashes/Nanosuit/releases) [![Latest Release Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/latest/total.svg?label=Downloads%20(Latest%20Release))](https://github.com/nltp-ashes/Nanosuit/releases/latest)

---

Fend off the Zone's dangers with the Nanosuit, a powerful and extremely versatile combat armor from Crysis.

---

### ABOUT

This addon adds a fully operational Nanosuit from Crysis. 

Bellow is a list of features that are currently available in the addon :

Armor mode :
- Absorbs all incoming damage as long as the suit has energy
- The more powerful is the impact, the more energy it consumes
- Some damage types consume more energy than others
- When the suit is out of energy, all incoming damage is transferred to the player
- The suit does not protect against psi-emissions and blunt force (fall-damage, poltergeist throws, etc.)

Speed mode :
- Increases walk speed by 25%, does not consume energy
- Increases run speed by 25%, running consumes energy
- Decreases time to aim down sights by 40%, does not consume energy
- When low on energy, the bonuses get temporarily disabled

Strength mode :
- Increases melee damage by up to 100%, proportionally to the suit's energy level
- Increases jump height by 100%, proportionally to the suit's energy level
- Increases carrying capacity by 25kg
- Decreases weapon recoil by a factor of 10, for as long as the suit has energy
- Shooting while in strength mode consumes energy
- When low on energy, recoil goes back to normal

Cloak mode :
- Visually cloaks the player's hands and items while active
- Moving while in cloak mode consumes energy. The faster you move the faster the energy gets consumed
- Shooting while in cloak mode completely depletes the suit's energy
- The player is cloaked from NPC's vision while cloak mode is active
- When getting too close to an NPC while in cloak mode, they will start to notice you

HUD :
- Added a custom HUD when wearing the suit. HUD dynamically switches from vanilla HUD to the Nanosuit's and back
- HUD is divided in 3 parts : the menu, the left side shows a minimap, the right side shows the suit's status
- The menu (opened by pressing V) allows you to switch from one mode to another
- The minimap shows all human objects around the player
- The status hub shows the suit's current mode, energy level, health, ammo count, ammo reserve and fire mode

Miscellaneous :
- The Nanosuit voice-lines are available in English, French and Russian, depending on the game language
- When dying, the suit vaporizes the player, leaving no body behind

---

### REQUIREMENTS

These addons are **absolutely required** in order for Nanosuit to work :
1. [S.T.A.L.K.E.R. Anomaly 1.5.3](https://www.moddb.com/mods/stalker-anomaly/downloads/stalker-anomaly-153).
2. [S.T.A.L.K.E.R. Anomaly Modded Exes 03.06.2025 (or newer)](https://github.com/themrdemonized/xray-monolith)
3. [First Person Visible Body](https://www.moddb.com/mods/stalker-anomaly/addons/swm-ported-visible-body-starter-version) (this dependency will be optional in the final release, but is needed for now)

---

### INSTALLATION

To **install** the addon :
1. Download and install the requirements;
2. Download this addon;
3. Using MO2, click the "Install a mod from an archive" button;
4. Follow the instructions.

To **update** the addon :
1. In MO2, disable and delete the previous version of the addon;
2. Make sure to update the requirements;
3. Make sure to check the changelog for extra steps;
4. Follow the installation instructions.

To **uninstall** the addon :
1. Un-wear the suit if you have it equipped;
2. Close your game, disable and delete the addon from MO2.

---

### CHANGELOG

You can check out the changelog of the last update in the [CHANGELOG.md](CHANGELOG.md) file.

For past updates, please refer to the description of each release, in the [releases tab](https://github.com/nltp-ashes/Nanosuit/releases).

---

### KNOWN ISSUES

- Cloak mode does not work if the NPC sees the actor before the cloak is applied, right now you need to break vision for it to work
- Cloak mode does not work on mutants
- The key-bind to open the suit menu is not configurable. It should be configurable
- When wearing the suit, the player footsteps do not change. They should use custom sounds
- The shader and textures used for cloak mode are not the best. They should be improved
- Speed mode should increase reload speed. This is impossible due to engine limitations. Will probably never be fixed
- If actor interacts with an NPC while they're getting vaporized, the game will crash

If you truly believe your problem is new, please open an issue [on the addon's GitHub page](https://github.com/nltp-ashes/Nanosuit/issues/new).

---

### SUPPORT & SUGGESTIONS

If you need help with anything, or if you have any suggestions, you can :
- ✅ Message me on [ModDB](https://www.moddb.com/members/nltp-ashes);
- ✅ Message me on Discord : @nltp_ashes (formerly NLTP_ASHES#0117);
- ✅ Message me on my [Discord](https://discord.gg/7Z8S2qg) server;

---

### SPECIAL THANKS & CREDITS

Credit goes to these people for their work contained in this addon :

|                                Name                                 |                                          Motive                                           |         License         |
|:-------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------:|:-----------------------:|
|                             **Tronex**                              |                  Reused their "Indicators" HUD from actor_status.script                   |       Proprietary       |
|                          **Stalker_Boss**                           |                             Translated the addon into Russian                             |       Proprietary       |
|         **[Crepis](https://www.moddb.com/members/cr3pis)**          | Greatly improved the quality of the inventory icon, upgrade icon and character portraits  |       Proprietary       |
|     **[Blackgrowl](https://www.moddb.com/members/strogglet15)**     | Greatly improved the texture quality of the first and third person models of the Nanosuit | See [LICENSE](#license) |
| **[\_Paramonov Alexander\_](https://users.playground.ru/1997780/)** |             Port of the Nanosuit first person, third person and world models              |       Proprietary       |
|             **[Crytek GmbH](https://www.crytek.com/)**              |                     Various assets (textures, sound effects, models)                      |       Proprietary       |

Special thanks to these people for their help in the making of this addon :

|                      Name                      |                                                     Motive                                                     |
|:----------------------------------------------:|:--------------------------------------------------------------------------------------------------------------:|
| **[Lucy](https://www.moddb.com/members/r3zy)** | For adding engine support to change, at runtime and using scripts, the textures and shaders of any game_object |

---

### LICENSE

Everything contained in Nanosuit and made by me, NLTP_ASHES, is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).

This means you're allowed to redistribute and/or adapt the work, as long as you respect the following criteria :
- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
- **NonCommercial** — You may not use the material for commercial purposes (this includes donations).
- **ShareAlike** — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

Content made by Blackgrowl can be reused, as long as you credit him for the work he did in this addon (texture work, model fixes).

For the work that wasn't made by me, unless a licence is specified in the [Credits](#special-thanks--credits) or in the files themselves, consider these works proprietary. If you want to reuse those, please get in touch with their original authors.
