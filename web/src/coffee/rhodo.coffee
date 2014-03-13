WIDTH = 320
HEIGHT = 480

MainStage = require('./view/mainstage')

$ ->
  renderer = PIXI.autoDetectRenderer(WIDTH, HEIGHT)

  $('div#screen').append(renderer.view)

  stage = new MainStage(WIDTH, HEIGHT).initialize()

  animate = () ->
    requestAnimFrame( animate )

    renderer.render(stage)

  requestAnimFrame( animate )
