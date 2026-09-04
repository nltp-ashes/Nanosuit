## **v0.13.0 - 04/09/2026 - Beta Build**

[![Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/v0.13.0/total?label=Downloads)]()

**• Additions :**
> - Added the Nanosuit to Nimble, Meeker, Spore, Hermann, Monolith and UNISG traders;
> - Added custom icon for weapons that use fire mode "0" (safe);
> - Added back `repair_type` property because other mods wrongly expect it to be defined and CTD if absent;
> - Added a custom ammo type icon when using grenade launchers or under-barrel grenade launchers;
> - Added a custom texture for the ammo wheel while wearing the Nanosuit;
> - Added a custom texture for the timer (often seen in labs) while wearing the Nanosuit;
> - Added a custom texture for the companion command wheel while wearing the Nanosuit;
> - Added a custom texture for the companion list while wearing the Nanosuit;

**• Changes :**
> - Changed price of the Nanosuit 1.0 from 419k RUB to 220k RUB;
> - Changed price of the Korean Nanosuit from 419k RUB to 190k RUB;
> - Changed the nano-vision energy consumption : it now consumes 5% once when activated;
> - Reduced the suit's built-in night-vision energy consumption by half (now 1% every second, was 2%);
> - Removed a part of the patch for SWM First Person Visible Body that was left over;

**• Bug fixes :**
> - Fixed detector not being hidden when using the suit's built-in binoculars;
> - Fixed Nanosuit HUD being frame locked at 1FPS instead of 60FPS when the player is dead;
> - Fixed binoculars being available when the suit is in malfunction state;
> - Fixed nightvision energy bar not displaying properly when the suit is in malfunction state;
> - Fixed some broken translations in Russian;
> - Fixed tactical map refreshing its object pool even when it is disabled;
> - Fixed the player's Nanosuit entering malfunction state when an NPC gets vaporized;
> - Fixed CTD when the player's current weapon's fire mode is not recognized by the Nanosuit HUD;
> - Fixed CTD when the game task points to an ID that does not exist in the world;
> - Fixed CTD when the player is looting an NPC that is being vaporized;
