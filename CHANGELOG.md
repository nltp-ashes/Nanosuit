## **v0.13.0 - 29/08/2026 - Beta Build**

[![Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/v0.13.0/total?label=Downloads)]()

**• Additions :**
> - Added custom icon for weapons that use fire mode "0" (safe);
> - Added back `repair_type` property because other mods wrongly expect it to be defined and CTD if absent;
> - Added a custom texture for the ammo wheel while wearing the Nanosuit;
> - Added a custom texture for the timer (often seen in labs) while wearing the Nanosuit;

**• Changes :**
> - Removed a part of the patch for SWM First Person Visible Body that was left over; 

**• Bug fixes :**
> - Fix binoculars being available when the suit is in malfunction state;
> - Fix nightvision energy bar not displaying properly when the suit is in malfunction state;
> - Fixed some broken translations in Russian;
> - Fixed tactical map refreshing its object pool even when it is disabled;
> - Fixed CTD when the player's current weapon's fire mode is not recognized by the Nanosuit HUD;
> - Fixed CTD when the game task points to an ID that does not exist in the world;
