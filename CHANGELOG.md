## **v0.13.0 - 26/08/2026 - Beta Build**

[![Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/v0.13.0/total?label=Downloads)]()

**• Additions :**
> - Added custom icon for weapons that use fire mode "0" (safe);
> - Added back `repair_type` property because other mods wrongly expect it to be defined and CTD if absent;

**• Changes :**

**• Bug fixes :**
> - Fixed some broken translations in Russian;
> - Fixed tactical map refreshing its object pool even when it is disabled;
> - Fixed CTD when the player's current weapon's fire mode is not recognized by the Nanosuit HUD;
> - Fixed CTD when the game task points to an ID that does not exist in the world;