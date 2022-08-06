local fireutil = require("__base__.prototypes.fire-util")
local nuke_explosions = require("data-nuke-explosions")

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local nuke_materials = require("data-nukes-material")



if(settings.startup["enable-very-big-atomic-artillery"].value) then
  -- These are all just to let us trigger the nukes nicely...
  local M1_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-shell-atomic-2-stage-15kt"])
  M1_atomic_artillery_projectile.name = "TN-artillery-atomic-2-stage-1Mt"
  M1_atomic_artillery_projectile.action[1].action_delivery.target_effects = nuke_explosions.N1Mt_detonation

  local M5_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-shell-atomic-2-stage-15kt"])
  M5_atomic_artillery_projectile.name = "TN-artillery-atomic-2-stage-5Mt"
  M5_atomic_artillery_projectile.action[1].action_delivery.target_effects = nuke_explosions.N5Mt_detonation

  local M10_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-shell-atomic-2-stage-15kt"])
  M10_atomic_artillery_projectile.name = "TN-artillery-atomic-2-stage-10Mt"
  M10_atomic_artillery_projectile.action[1].action_delivery.target_effects = nuke_explosions.N10Mt_detonation

  local M50_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-shell-atomic-2-stage-15kt"])
  M50_atomic_artillery_projectile.name = "TN-artillery-atomic-2-stage-50Mt"
  M50_atomic_artillery_projectile.action[1].action_delivery.target_effects = nuke_explosions.N50Mt_detonation

  local M100_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-shell-atomic-2-stage-15kt"])
  M100_atomic_artillery_projectile.name = "TN-artillery-atomic-2-stage-100Mt"
  M100_atomic_artillery_projectile.action[1].action_delivery.target_effects = nuke_explosions.N100Mt_detonation

  local G1_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-shell-atomic-2-stage-15kt"])
  G1_atomic_artillery_projectile.name = "TN-artillery-atomic-2-stage-1Gt"
  G1_atomic_artillery_projectile.action[1].action_delivery.target_effects = nuke_explosions.N1Gt_detonation

  data:extend{M1_atomic_artillery_projectile, M5_atomic_artillery_projectile, M10_atomic_artillery_projectile, M50_atomic_artillery_projectile, M100_atomic_artillery_projectile, G1_atomic_artillery_projectile}
end

data:extend{
  {
    type = "recipe-category",
    name = "nuclear-detonation"
  },
  {
    type = "technology",
    name = "tritium-proccessing",
    icon_size = 256, icon_mipmaps = 1,
    icon = "__True-Nukes__/graphics/tritium-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tritium-breeder-fuel-cell"
      },
      {
        type = "unlock-recipe",
        recipe = "tritium-extraction"
      }
    },
    prerequisites = {"nuclear-fuel-reprocessing"},
    unit =
    {
      count = 2500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 45
    },
    order = "e-a-b"
  }}

if mods["apm_nuclear_ldinc"] then
  data.raw.item["tritium-breeder-fuel-cell"].fuel_category = "apm_nuclear_breeder";
  table.insert(data.raw.technology["tritium-proccessing"].prerequisites, "apm_nuclear_breeder");
end


data:extend{{
  type = "technology",
  name = "fusion-weapons",
  icon_size = 256, icon_mipmaps = 1,
  icon = "__True-Nukes__/graphics/fusion-bomb.png",
  effects = {},
  prerequisites = {"tritium-proccessing"},
  unit =
  {
    count = 2000,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"military-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1}
    },
    time = 45
  },
  order = "e-b-c"
}}
if(settings.startup["enable-big-atomic-ammo"].value or settings.startup["enable-big-atomic-cannons"].value
  or settings.startup["enable-big-atomic-bomb"].value or settings.startup["enable-very-big-atomic-bomb"].value
  or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
--  table.insert(data.raw.technology["fusion-weapons"].prerequisites, "scary-atomic-weapons");
elseif(settings.startup["enable-small-atomic-artillery"].value or settings.startup["enable-atomic-artillery"].value) then
  table.insert(data.raw.technology["fusion-weapons"].prerequisites, "atomic-artillery-shells");
else
  table.insert(data.raw.technology["fusion-weapons"].prerequisites, "atomic-bomb");
end
if(settings.startup["enable-very-big-atomic-artillery"].value) then
  table.insert(data.raw.technology["fusion-weapons"].effects,
    {
      type = "unlock-recipe",
      recipe = "FOGBANK"
    })
--  table.insert(data.raw.technology["fusion-weapons"].effects,
--    {
--      type = "unlock-recipe",
--      recipe = "TN-very-big-atomic-artillery-shell"
--    })
  if(settings.startup["enable-fusion-building"].value or settings.startup["enable-mega-fusion-building"].value) then
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "megaton-nuke"
      })
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "15kiloton-detonation"
      })
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "100kiloton-detonation"
      })
  end
  if(settings.startup["enable-mega-fusion-building"].value) then
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "megaton-detonation"
      })
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "5megaton-detonation"
      })
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "10megaton-detonation"
      })
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "50megaton-detonation"
      })
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "100megaton-detonation"
      })
    table.insert(data.raw.technology["fusion-weapons"].effects,
      {
        type = "unlock-recipe",
        recipe = "1gigaton-detonation"
      })
  end
end
if(settings.startup["enable-mega-fusion-building"].value) then
  data:extend{
    {
      name = "TN-atomic-detonation",
      type = "item-subgroup",
      group = "intermediate-products",
      order = "z1[TN-atomic-detonation]"
    },
    {
      type = "recipe",
      name = "megaton-detonation",
      category = "nuclear-detonation",
      enabled = false,
      energy_required = 120,
      ingredients =
      {
        {"tritium-canister", 50}
      },
      result = "megaton-detonation"
    },
    {
      type = "item",
      name = "megaton-detonation",
      icon = "__True-Nukes__/graphics/megaton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-ba[1Mt]",
      stack_size = 1
    }}

  data:extend{
    {
      type = "recipe",
      name = "5megaton-detonation",
      category = "nuclear-detonation",
      enabled = false,
      energy_required = 120,
      ingredients =
      {
        {"tritium-canister", 250}
      },
      result = "5megaton-detonation"
    },
    {
      type = "item",
      name = "5megaton-detonation",
      icon = "__True-Nukes__/graphics/5megaton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-bb[5Mt]",
      stack_size = 1
    }}

  data:extend{
    {
      type = "recipe",
      name = "10megaton-detonation",
      category = "nuclear-detonation",
      enabled = false,
      energy_required = 300,
      ingredients =
      {
        {"tritium-canister", 500}
      },
      result = "10megaton-detonation"
    },
    {
      type = "item",
      name = "10megaton-detonation",
      icon = "__True-Nukes__/graphics/10megaton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-bc[10Mt]",
      stack_size = 1
    }}

  data:extend{
    {
      type = "recipe",
      name = "50megaton-detonation",
      category = "nuclear-detonation",
      enabled = false,
      energy_required = 300,
      ingredients =
      {
        {"tritium-canister", 2500}
      },
      result = "50megaton-detonation"
    },
    {
      type = "item",
      name = "50megaton-detonation",
      icon = "__True-Nukes__/graphics/50megaton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-bd[50Mt]",
      stack_size = 1
    }}

  data:extend{
    {
      type = "recipe",
      name = "100megaton-detonation",
      category = "nuclear-detonation",
      enabled = false,
      energy_required = 600,
      ingredients =
      {
        {"tritium-canister", 5000}
      },
      result = "100megaton-detonation"
    },
    {
      type = "item",
      name = "100megaton-detonation",
      icon = "__True-Nukes__/graphics/100megaton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-be[100Mt]",
      stack_size = 1
    }}

  data:extend{
    {
      type = "recipe",
      name = "1gigaton-detonation",
      category = "nuclear-detonation",
      enabled = false,
      energy_required = 600,
      ingredients =
      {
        {"tritium-canister", 50000}
      },
      result = "1gigaton-detonation"
    },
    {
      type = "item",
      name = "1gigaton-detonation",
      icon = "__True-Nukes__/graphics/1gigaton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-bf[1Gt]",
      stack_size = 1
    }}
end
if(settings.startup["enable-fusion-building"].value or settings.startup["enable-mega-fusion-building"].value) then
  data:extend{
    {
      type = "recipe",
      name = "megaton-nuke",
      enabled = false,
      energy_required = 120,
      ingredients =
      {
        {"TN-warhead-big--1", 1},
        {"steel-plate", 1000},
        {"refined-concrete", 1000},
        {"advanced-circuit", 25},
        {"accumulator", 10}
      },
      result = "megaton-nuke"
    },
    {
      type = "recipe",
      name = "100kiloton-detonation",
      category = "nuclear-detonation",
      enabled = false,
      energy_required = 120,
      ingredients =
      {
        {"tritium-canister", 5}
      },
      result = "100kiloton-detonation"
    },
    {
      type = "recipe",
      name = "15kiloton-detonation",
      category = "nuclear-detonation",
      enabled = false,
      energy_required = 120,
      ingredients =
      {
      },
      result = "15kiloton-detonation"
    },
    {
      type = "item",
      name = "megaton-nuke",
      icon = "__True-Nukes__/graphics/megaton-nuke.png",
      icon_size = 64, icon_mipmaps = 1,
      subgroup = "defensive-structure",
      order = "e[nuke]-a[megaton-nuke]",
      place_result = "megaton-nuke",
      stack_size = 1
    },
    {
      type = "item",
      name = "100kiloton-detonation",
      icon = "__True-Nukes__/graphics/100kiloton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-a[100kt]",
      stack_size = 1
    },
    {
      type = "item",
      name = "15kiloton-detonation",
      icon = "__True-Nukes__/graphics/15kiloton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-a[015kt]",
      stack_size = 1
    },
    {
      type = "assembling-machine",
      name = "megaton-nuke",
      icon = "__True-Nukes__/graphics/megaton-nuke.png",
      icon_size = 64, icon_mipmaps = 1,
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {mining_time = 10, result = "megaton-nuke"},
      max_health = 5000,
      corpse = "assembling-machine-1-remnants",
      dying_explosion = "massive-explosion",
      resistances =
      {
        {
          type = "fire",
          percent = 70
        }
      },
      collision_box = {{-1.90, -1.40}, {1.90, 1.40}},
      selection_box = {{-2, -1.5}, {2, 1.5}},
      damaged_trigger_effect = hit_effects.entity(),
      alert_icon_shift = util.by_pixel(-3, -12),
      map_color = {r = 0, g = 1, b = 0, a = 1},
      created_effect = {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects = {
            type = "script",
            effect_id = "Mega-nuke built"
          }
        }
      },
      dying_trigger_effect =
      {
        type = "nested-result",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects = {
              {
                type = "nested-result",
                action =
                {
                  type = "area",
                  target_entities = false,
                  trigger_from_target = true,
                  repeat_count = 1,
                  radius = 1,
                  action_delivery =
                  {
                    type = "projectile",
                    show_in_tooltip = false,
                    projectile = "lingering-fallout",
                    starting_speed = 0.0001,
                  }
                }
              },
              {
                type = "nested-result",
                action =
                {
                  type = "area",
                  target_entities = false,
                  trigger_from_target = true,
                  repeat_count = 5,
                  radius = 5,
                  action_delivery =
                  {
                    type = "projectile",
                    show_in_tooltip = false,
                    projectile = "fallout",
                    starting_speed = 0.0001
                  }
                }
              }
            }
          }
        }
      },
      animation =
      {
        layers =
        {
          {
            filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-base.png",
            width = 212,
            height = 192,
            shift = util.by_pixel(0, -5),
            scale = 0.5,
            hr_version =
            {
              filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-base.png",
              width = 212,
              height = 192,
              shift = util.by_pixel(0, -5),
              scale = 0.5
            }
          },
          {
            filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-shadow.png",
            priority = "high",
            width = 287,
            height = 159,
            repeat_count = repeat_count,
            shift = util.by_pixel(20, 6),
            draw_as_shadow = true,
            scale = 0.5,
            hr_version =
            {
              filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-shadow.png",
              priority = "high",
              width = 287,
              height = 159,
              repeat_count = repeat_count,
              shift = util.by_pixel(20, 6),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      crafting_categories = {"nuclear-detonation"},
      crafting_speed = 1,
      energy_source = {type = "void"},
      energy_usage = "1kW",
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      vehicle_impact_sound = sounds.generic_impact,
      working_sound =
      {
        sound =
        {
          filename = "__base__/sound/silo-alarm.ogg",
          volume = 1.0
        },
        use_doppler_shift = false,
        audible_distance_modifier = 1,
        fade_in_ticks = 4,
        fade_out_ticks = 20
      }
    }}
end



      
