window.RHConfig = {}
window.RHConfig =
  Screen:
    Width: 300
    Height: 450

MainStage = require('./view/mainstage')

$ ->
  screen = window.RHConfig.Screen
  renderer = PIXI.autoDetectRenderer(screen.Width, screen.Height)

  $('div#screen').append(renderer.view)

  stage = new MainStage().initialize()

  animate = () ->
    requestAnimFrame( animate )

    stage.step()

    renderer.render(stage)

  requestAnimFrame( animate )
