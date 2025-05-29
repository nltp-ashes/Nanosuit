## **v0.6.0 - 29/05/2025 - Alpha Build**

[![Downloads](https://img.shields.io/github/downloads/nltp-ashes/Nanosuit/v0.6.0/total?label=Downloads)]()

**• Additions :**
> • Added a first version of the Nanosuit's HUD. The HUD will override the vanilla HUD when the Nanosuit is equipped;

**• Changes :**
> • Changed how boosters take effect, they now apply to slots instead of "active items" (didn't include torch, detectors, ...);
> • Changed how the Nanosuit is initialized and destroyed : will now wait 1 tick to let callbacks go through;
> • Refactored carry weight bonus into a booster;

**• Bug fixes :**
> • Fixed active item tracking not being correct and letting some effects apply to non-active item objects;