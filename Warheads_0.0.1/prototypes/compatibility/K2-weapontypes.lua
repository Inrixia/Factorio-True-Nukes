weaponTypes["pistol-magazine"]= {
  type = "projectile",
  size = 4,
  baseName = "pistol-magazine",
  baseOrder = "a[basic-clips]-a02z",
  base_item = "piercing-rounds-magazine",
  energy_required = 1,
  appearance_fallback = "rounds-magazine",
  icons = {},
  lights = {},
  image_base_shift = {4, 2},
  image_warhead_shift = {-8, -8},
  item = table.deepcopy(data.raw.ammo["piercing-rounds-magazine"]),
  projectile = table.deepcopy(data.raw.projectile["pistol-ammo-2"]),
}
weaponTypes["rifle-magazine"]= {
  type = "projectile",
  size = 8,
  baseName = "rifle-magazine",
  baseOrder = "a[basic-clips]-a06z",
  base_item = "armor-piercing-rifle-magazine",
  energy_required = 1,
  appearance_fallback = "rounds-magazine",
  icons = {},
  lights = {},
  image_base_shift = {4, 2},
  image_warhead_shift = {-8, -8},
  item = table.deepcopy(data.raw.ammo["armor-piercing-rifle-magazine"]),
  projectile = table.deepcopy(data.raw.projectile["rifle-ammo-2"]),
}
weaponTypes["anti-material-rifle-magazine"]= {
  type = "projectile",
  size = 13,
  baseName = "anti-material-rifle-magazine",
  baseOrder = "a[basic-clips]-a10z",
  base_item = "armor-piercing-anti-material-rifle-magazine",
  energy_required = 1,
  appearance_fallback = "rounds-magazine",
  icons = {},
  lights = {},
  image_base_shift = {4, 2},
  image_warhead_shift = {-8, -8},
  item = table.deepcopy(data.raw.ammo["armor-piercing-anti-material-rifle-magazine"]),
  projectile = table.deepcopy(data.raw.projectile["anti-material-rifle-ammo-2"]),
}
weaponTypes["rounds-magazine"] = nil

weaponTypes["big-rocket"].category = "heavy-rocket"
weaponTypes["big-rocket"].base_item = "heavy-rocket"
weaponTypes["big-rocket"].extra_ingredients = nil

weaponTypes["railgun-shell"]= {
  type = "projectile",
  size = 25,
  baseName = "railgun-shell",
  baseOrder = "b02z",
  base_item = "basic-railgun-shell",
  energy_required = 1,
  appearance_fallback = "cannon",
  icons = {},
  lights = {},
  image_base_shift = {4, 2},
  image_warhead_shift = {-8, -8},
  item = table.deepcopy(data.raw.ammo["basic-railgun-shell"]),
  projectile = table.deepcopy(data.raw.projectile["basic-railgun-projectile"]),
}

weaponTypes["turret-rocket"]= {
  type = "projectile",
  size = 25,
  baseName = "turret-rocket",
  baseOrder = "b06[explosion-rocket-for-turret]",
  base_item = "explosive-turret-rocket",
  energy_required = 1,
  appearance_fallback = "big-rocket",
  icons = {},
  lights = {},
  image_base_shift = {-4, 0},
  item = table.deepcopy(data.raw.ammo["explosive-turret-rocket"]),
  projectile = table.deepcopy(data.raw.projectile["explosion-turret-rocket-projectile"]),
}
