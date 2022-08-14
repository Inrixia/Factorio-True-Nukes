weaponTypes["Schall-sniper-magazine"]= {
  type = "bullet",
  size = 13,
  baseName = "Schall-sniper-magazine",
  baseOrder = "a[basic-clips]-s[sniper-rifle]-d",
  base_item = "Schall-sniper-piercing-rounds-magazine",
  ammo_category = "Schall-sniper-bullet",
  icons = {
    {icon = "__base__/graphics/icons/piercing-rounds-magazine.png", icon_size = 64, icon_mipmaps = 4},
    {icon = "__SchallTankPlatoon__/graphics/icons/sniper-bullet.png", icon_size = 128, icon_mipmaps = 3}
  },
  energy_required = 1,
  warhead_count = 10,
  icons = {},
  lights = {},
  image_base_shift = {4, 2},
  image_warhead_shift = {-8, -8},
  item = table.deepcopy(data.raw.ammo["piercing-rounds-magazine"]),
}
