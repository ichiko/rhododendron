WIDTH = 300
HEIGHT = 450

MainStage = require('./view/mainstage')

$ ->
  renderer = PIXI.autoDetectRenderer(WIDTH, HEIGHT)

  $('div#screen').append(renderer.view)

  stage = new MainStage(WIDTH, HEIGHT).initialize()

  animate = () ->
    requestAnimFrame( animate )

    stage.step()

    renderer.render(stage)

  requestAnimFrame( animate )
