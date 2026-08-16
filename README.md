# Nanosuit [![License](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

[![Latest Stable Build](https://img.shields.io/github/v/release/nltp-ashes/Nanosuit?label=Latest%20Stable%20Build&color=brightgreen)](https://github.com/nltp-ashes/Nanosuit/releases/latest) [![Latest Test Build](https://img.shields.io/github/v/release/nltp-ashes/Nanosuit?include_prereleases&filter=*rc*&display_name=tag&label=Latest%20Test%20Build&color=yellow)]() [![Total Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/total.svg?label=Downloads%20(All%20Time))](https://github.com/nltp-ashes/Nanosuit/releases) [![Latest Release Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/latest/total.svg?label=Downloads%20(Latest%20Release))](https://github.com/nltp-ashes/Nanosuit/releases/latest)

---

Fend off the Zone's dangers with the Nanosuit, a powerful and extremely versatile combat armor from Crysis.

---

### ABOUT

This addon adds a fully operational US and Korean nanosuits from Crysis.

**Important :** This addon is still in development. You have to spawn the outfit using the [debug menu item spawner](https://igigog.github.io/anomaly-modding-book/modding-tools/in-game-editors/item-spawner.html).

**Important :** Expect soft-conflicts (aka it will work, but it won't look nice) with UI mods. Please report as many UI related issues as you can.

Bellow is a list of features that are currently available in the addon :

Miscellaneous :
- The suit comes with third person, first person and world models; inventory icons and character portraits
- The suit voice-lines are available in English, French and Russian, depending on the game language
- The suit has basic ballistic, rupture and explosive protection when out of energy
- The suit will absorb low amounts of radiation, without consuming energy
- The suit will also absorb higher amounts of radiation, but at the cost of energy
- The suit has built-in binoculars, with x2 and x4 zoom levels
- When the suit is out of energy, all incoming damage is transferred to the player
- The addon features an MCM menu, allowing you to change some settings on the fly

Armor mode :
- Absorbs all incoming damage as long as the suit has energy
- The more powerful is the impact, the more energy it consumes
- Some damage types consume more energy than others
- The mode does not protect against psi-emissions and blunt force (fall-damage, poltergeist throws, etc.)

Speed mode :
- Increases walk speed by 25%, does not consume energy
- Increases run speed by 25%, running consumes energy
- Decreases time to aim down sights by 40%, does not consume energy
- When low on energy, the bonuses get temporarily disabled

Strength mode :
- Increases melee damage by 100%
- Increases jump height by 100%, proportionally to the suit's energy level
- Increases carrying capacity by 25kg
- Decreases weapon recoil by a factor of 10, for as long as the suit has energy
- Protects against fall damage, as long as the suit has energy
- Shooting while in strength mode consumes energy
- When low on energy, recoil goes back to normal

Cloak mode :
- Visually cloaks the player's hands and items while active
- Moving while in cloak mode consumes energy. The faster you move the faster the energy gets consumed
- Shooting while in cloak mode completely depletes the suit's energy
- The player is cloaked from NPC's vision while cloak mode is active
- When getting too close to an NPC while in cloak mode, they will start to notice you
- On semi-modern renderers (DirectX 10 & 11), the cloak mode uses a custom-made shader

HUD :
- Added a custom HUD when wearing the suit. HUD dynamically switches from vanilla HUD to the Nanosuit's and back
- HUD is divided in 3 parts : the menu, the left side shows a minimap, the right side shows the suit's status
- The menu (opened by pressing V, configurable in MCM) allows you to switch from one mode to another
- The minimap shows all human objects around the player
- The status hub shows the suit's current mode, energy level, health, stamina, ammo count, ammo reserve and fire mode

Defibrillator :
- If the player dies, under certain conditions, an animated sequence will play, giving the option to get a second chance
- The defibrillator can only be used when dying from certain damage types (fall damage, radiation, lacerations)
- A defibrillator powerbank is required for the defibrillator to activate
- Powerbanks are single use, and need to be replaced after being revived
- Powerbanks are the only item that can be attached the player's belt when wearing the suit
- During the defibrillator sequence, the player has a 3 seconds window to press Space (configurable in MCM), after which the player dies

Malfunctions :
- The suit can malfunction, turning it off (protection and bonuses are removed) and disabling the HUD (turns red and indicators are offline)
- The suit malfunctions when the player dies, or when hit by a psi-storm vortex, or by a pulse anomaly
- The suit will also malfunction during the storylines that will be added in the future

Vaporization :
- When the player (or an NPC) dies wearing the suit, they will be vaporized, leaving no body behind
- When the player enters combat with an NPC, and then tries to escape the fight, they will be vaporized
- The player is allowed to walk away from a fight with zombies, or Monolith fighters
- When NPCs get vaporized alive, they enter a special animation

Nanovision :
- If [HeatVision v1.3](https://www.moddb.com/mods/stalker-anomaly/addons/heatvision-v02-extension-for-beefs-nvg-dx11engine-mod) is installed, the suit will have built-in nanovision
- Consumes 2% per second when active
- When out of energy, nanovision will be disabled automatically
- Uses the suit's main energy pool
- Having any device equipped in the night-vision slot will make the nanovision unavailable

Nightvision :
- The suit comes with built-in nightvision
- Consumes 2% per second when active
- When out of energy, nightvision will be disabled automatically
- Uses its own source of energy, separate from the suit's main energy pool
- Having any device equipped in the night-vision slot will make the nightvision unavailable

---

### REQUIREMENTS

These addons are **absolutely required** in order for the addon to work :
1. [S.T.A.L.K.E.R. Anomaly 1.5.3](https://www.moddb.com/mods/stalker-anomaly/downloads/stalker-anomaly-153).
2. [S.T.A.L.K.E.R. Anomaly Modded Exes 16.08.2026 (or newer)](https://github.com/themrdemonized/xray-monolith)

The addon natively integrates[^native_integrations] with the following addons, but they **aren't required** :
1. [Mod Configuration Menu v1.7](https://www.moddb.com/mods/stalker-anomaly/addons/anomaly-mod-configuration-menu) (customizable options for the addon);
2. [Hunger, thirst, sleepiness bars v1.01](https://www.moddb.com/mods/stalker-anomaly/addons/hunger-thirst-sleepiness-bars) (custom nanosuit styling for hunger, thirst and sleepiness indicator);
3. [Campfire Healing And Designated Savepoint indicator v2.1](https://www.moddb.com/mods/stalker-anomaly/addons/campfire-healing-and-designated-savepoint-indicator) (custom nanosuit styling for campfire indicators);
4. [Body Health System Redux v2.0.2](https://www.moddb.com/mods/stalker-anomaly/addons/100-groks-body-health-system-redux-for-151) (built-in compatibility, to prevent UI overlaps);
5. [HeatVision v1.3](https://www.moddb.com/mods/stalker-anomaly/addons/heatvision-v02-extension-for-beefs-nvg-dx11engine-mod) (adds nanovision to the suit, if installed);
6. [Faction Identification UI v1.2.2](https://www.moddb.com/mods/stalker-anomaly/addons/crooks-faction-identification-ui) (built-in compatibility, to prevent UI overlaps);

[^native_integrations]: Native integration are similar to compatibility patches, except they are built-into the addon. If the other addon is installed, the features will be available, if not, they will be disabled, all without requiring any extra steps from the user.

---

### INSTALLATION

To **install** the addon :
1. Download and install the requirements;
2. Download this addon;
3. Using MO2, click the "Install a mod from an archive" button;
4. Follow the instructions;
5. Clear the shader cache.

To **update** the addon :
1. In MO2, disable and delete the previous version of the addon;
2. Make sure to update the requirements;
3. Make sure to check the changelog for extra steps;
4. Follow the installation instructions;
5. Clear the shader cache.

To **uninstall** the addon :
1. Un-wear the suit if you have it equipped;
2. Close your game, disable and delete the addon from MO2;
3. Clear the shader cache.

---

### CHANGELOG

You can check out the changelog of the last update in the [CHANGELOG.md](CHANGELOG.md) file.

For past updates, please refer to the description of each release, in the [releases tab](https://github.com/nltp-ashes/Nanosuit/releases).

---

### FUTURE WORKS

Here is a list of planned features for the addon :
- Add a storyline that will allow the player to acquire the suit;
- Add a female version of the nanosuit;
- Custom footsteps when wearing the suit;
- Add suit modes shortcuts;
- Finish the tactical map UI (and add range);
- Finish the binoculars UI
- Add custom indicators to replace BHS UI;
- Vaporize (or at least penalize) the player if they decide to become free stalker at the end of UNISG storyline;
- Muffle sounds during cloak mode;

**A note on BHS :** Given the tentacular nature of BHS and its suite of addons, and how terrible its code is, I will not further improve the compatibility patch for it. I am open to take contributions if someone comes up with a better patch than mine, given mine is essentially just removing BHS's UI if it exists.

If you would like to help development for future updates, you can :
1. Contribute to the addon, either by [getting in touch with me](https://github.com/nltp-ashes/Nanosuit#support--suggestions) or [creating a fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) of the addon and [creating a pull-request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) on the addon's [GitHub repository](https://github.com/nltp-ashes/Nanosuit);
2. Help by play-testing updates by [getting Release Candidates builds](https://github.com/nltp-ashes/Nanosuit/releases/) on the addon's GitHub repository.

---

### KNOWN ISSUES

The following issues will be fixed in the near future :
- Cloak mode does not cloak the knife during the mutant skinning animation with FDDA
- The game crashes if player reloads a save while cloak mode is enabled
- Indicators are not colored properly when using the Korean nanosuit

The following issues are technical limitations and will not be fixed in the foreseeable future :
- The game crashes if actor interacts with an NPC while they're getting vaporized
- Cloak mode does not work if the NPC sees the actor before the cloak is applied (workaround : need to break vision for it to work)
- Cloak mode does not work on mutants
- Speed mode should increase reload speed

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

|                                Name                                 |                                                    Motive                                                    |                           License                            |
|:-------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------:|
|      **[Captain Vityaz](https://www.youtube.com/@CptVityaz)**       |                               Created high quality icons for the indicators UI                               | [PD 1.0](https://creativecommons.org/publicdomain/mark/1.0/) |
|                             **Catspaw**                             |                  Allowed the reusing of a custom color picker widget for MCM in this addon                   |                   See [LICENSE](#license)                    |
|                            **Medialuna**                            |                           Fixed the Korean nanosuit's world model collision volume                           |                         Proprietary                          |
|         **[Crepis](https://www.moddb.com/members/cr3pis)**          |      Provided high quality inventory icon, upgrade icon and character portrait for the Korean nanosuit       |                         Proprietary                          |
|     **[Blackgrowl](https://www.moddb.com/members/strogglet15)**     |                   Improved the texture quality of the Korean nanosuit's third person model                   |                   See [LICENSE](#license)                    |
|                         **wookie, 3vtiger**                         |                                Port of the Korean nanosuit third person model                                |                         Proprietary                          |
|                          **punished__joe**                          |                Ported the nanosuit hands and edited them to fit S.T.A.L.K.E.R.'s proportions                 |                         Proprietary                          |
|       **[xfightervn](https://www.deviantart.com/xfightervn)**       |                                     Reused their art for the MCM banner                                      |                         Proprietary                          |
|              **[LVutner](https://github.com/LVutner)**              |                                Provided an improved shader for the cloak mode                                |                   See [LICENSE](#license)                    |
|         **[Crepis](https://www.moddb.com/members/cr3pis)**          |                       Provided an inventory icon for the defibrillator powerbank item                        |                         Proprietary                          |
|                             **Tronex**                              |                            Reused their "Indicators" HUD from actor_status.script                            |                         Proprietary                          |
|                          **Stalker_Boss**                           |                                      Translated the addon into Russian                                       |                         Proprietary                          |
|         **[Crepis](https://www.moddb.com/members/cr3pis)**          | Greatly improved the quality of the inventory icon, upgrade icon and character portraits for the US nanosuit |                         Proprietary                          |
|     **[Blackgrowl](https://www.moddb.com/members/strogglet15)**     |          Greatly improved the texture quality of the first and third person models of the nanosuit           |                   See [LICENSE](#license)                    |
| **[\_Paramonov Alexander\_](https://users.playground.ru/1997780/)** |                       Port of the nanosuit first person, third person and world models                       |                         Proprietary                          |
|             **[Crytek GmbH](https://www.crytek.com/)**              |                               Various assets (textures, sound effects, models)                               |                         Proprietary                          |

Special thanks to these people for their help in the making of this addon :

|                      Name                      |                                                     Motive                                                     |
|:----------------------------------------------:|:--------------------------------------------------------------------------------------------------------------:|
|                    **MFB**                     |                        Tips about invisible walls and how they work in the X-Ray engine                        |
|                 **Vanquisher**                 |                             For extensive play-testing and all the feedback given                              |
|                 **Medialuna**                  |    For all the tips and tricks with modeling/textures that objectively made my life a little less miserable    |
| **[Lucy](https://www.moddb.com/members/r3zy)** | For adding engine support to change, at runtime and using scripts, the textures and shaders of any game_object |

---

### LICENSE

Everything contained in Nanosuit and made by me, NLTP_ASHES, is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).

This means you're allowed to redistribute and/or adapt the work, as long as you respect the following criteria :
- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
- **NonCommercial** — You may not use the material for commercial purposes (this includes donations).
- **ShareAlike** — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

Content made by Blackgrowl is provided under the following license :
```
The work can be reused, as long as you credit Blackgrowl for the work he did in this addon (texture work, model fixes).
```

Content made by LVutner is provided under the following license :
```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

Content made by Catspaw is provided under the following terms :
```
Redistribution is allowed, as long as Catspaw is credited, and altered copies of the script are not redistributed using the same filename, to avoid conflicts.
```

For the work that wasn't made by me, unless a license is specified in the [Credits](#special-thanks--credits) or in the files themselves, consider these works proprietary. If you want to reuse those, please get in touch with their original authors.
