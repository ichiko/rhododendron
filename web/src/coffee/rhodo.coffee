require('./config')

GameEngine = require('./controller/gameengine')
MainStage = require('./view/mainstage')

$ ->
  screen = window.RHConfig.Screen
  renderer = PIXI.autoDetectRenderer(screen.Width, screen.Height)

  $('div#screen').append(renderer.view)

  engine = new GameEngine()
  engine.addObstacleAtPoint(100, 100)

  stage = new MainStage(engine).initialize()

  animate = () ->
    requestAnimFrame( animate )

    engine.step()
    stage.update()

    renderer.render(stage)

  requestAnimFrame( animate )
