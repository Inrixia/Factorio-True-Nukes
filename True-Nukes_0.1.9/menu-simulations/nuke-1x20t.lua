local controlScript = require("control-script") 
data.raw["utility-constants"]["default"].main_menu_simulations.nuke_1x20t = 
{
  checkboard = false,
  save = "__base__/menu-simulations/menu-simulation-biter-base.zip",
  length = 60 * 12,
  init =
  [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
    logo.destructible = true
    logo.health = 1
    game.camera_position = {logo.position.x, logo.position.y+9.75}
    center = {logo.position.x, logo.position.y+9.75}
    game.camera_zoom = 1
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0
    game.forces.enemy.evolution_factor = 1

    game.surfaces[1].create_entity{name = "atomic-rocket", position = {center[1]+100, center[2]-100}, force = "player", target = {center[1]+10, center[2]-10}, speed = 1}

  ]] .. controlScript
}















