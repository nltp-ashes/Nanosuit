## **v0.15.0 - 19/10/2026 - Beta Build**

[![Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/v0.15.0/total?label=Downloads)]()

**• Additions :**
> - Added Arti's `speed.script`, which speed mode now uses for its run and sprint boost;
> - Added demonized's `weight.script`, which strength mode now uses for its carry weight boost;

**• Changes :**
> - Strength mode's carry weight boost now also raises the walk weight by about 35kg instead of 25kg;
> - Remade every HUD texture from vector sources, at the same pixel density across the whole HUD, and packed them into one texture atlas per UI;

**• Bug fixes :**
> - Fixed CTD when removing the suit, changing level or quitting while nanovision is active;
> - Fixed CTD when removing the suit while it is in malfunction state;
> - Fixed memory leak caused by the built-in nightvision code;
> - Fixed setting protection values to a certain hit type to 0 in MCM causing the suit to deplete all of its energy instead of just not absorbing damage;
> - Fixed setting protection values in MCM requiring the player to reequip the suit/reload a save for changes to take effect;
> - Fixed binoculars being accessible while a UI or the PDA was active;
> - Fixed ammo wheel, companion wheel and companion list UIs not changing color when the suit malfunctions;
> - Fixed ammo wheel UI not having its extended window customized to the Nanosuit HUD style;
> - Fixed vaporization sound effect always playing as a 3D sound instead of a 2D when in first-person;
> - Fixed speed and strength modes discarding weapon upgrades' stats if the upgrade is applied while the mode is active;
> - Fixed speed and strength modes potentially discarding other addon's changes to actor walk/run speeds and jump height;
> - Fixed cloak mode potentially unplugging other addons' code to manipulate NPC visibility;
