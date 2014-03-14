require('./config')

GameEngine = require('./controller/gameengine')
MainStage = require('./view/mainstage')

getElementPosition = (element) ->
  return {x: element.offsetLeft, y: element.offsetTop}

$ ->
  screen = window.RHConfig.Screen
  renderer = PIXI.autoDetectRenderer(screen.Width, screen.Height)

  $('div#screen').append(renderer.view)
  canvasPosition = getElementPosition($('div#screen')[0])

  engine = new GameEngine()
  engine.addObstacleAtPoint(100, 100)

  stage = new MainStage(engine).initialize()

  ### === マウスイベント === ###
  isMouseDown = false
  pointX = pointY = undefined

  handleMouseDown = (e) ->
    isMouseDown = true
    $('div#screen').mousemove(handleMouseMove)
    handleMouseMove(e)

  handleMouseMove = (e) ->
    e.preventDefault()
    pointX = e.clientX - canvasPosition.x
    pointY = e.clientY - canvasPosition.y

  handleMouseUp = (e) ->
    $('div#screen').unbind('mousemove', handleMouseMove)
    isMouseDown = false
    pointX = pointY = undefined

  $('div#screen').mousedown(handleMouseDown)
  $('div#screen').mouseup(handleMouseUp)

  ### === アニメーション描画 === ###

  animate = () ->
    requestAnimFrame( animate )

    if isMouseDown
      result = engine.shotTo(pointX, pointY)

    engine.step()
    stage.update()
    engine.clearStep()

    renderer.render(stage)

  requestAnimFrame( animate )
