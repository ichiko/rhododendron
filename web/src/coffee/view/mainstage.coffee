MObstacle = require('../model/straightobject').Obstacle
Obstacle = require('./parts/obstacle')

MRoundCannon = require('../model/roundcannon')
RoundCannon = require('./parts/roundcannon')

TitleLayer = require('./parts/titleLayer')

class MainStage extends PIXI.Stage
  constructor: ->
    super

  initialize: ->
    @addChild(new TitleLayer())

    screen = window.RHConfig.Screen
    rx = screen.Width / 2
    ry = screen.Height - 100
    rr = 50

    circle = new PIXI.Graphics()
    circle.lineStyle(1, 0xa0a0a0, 1)
    circle.drawCircle(rx, ry, rr)
    @addChild(circle)

    @obstacle = new Obstacle(new MObstacle(100, 100, {x: 0, y: 1}))
    @addChild(@obstacle)

    @cannons = []
    for initAngle in [90, 270]
      cannon = new RoundCannon(new MRoundCannon(rx, ry, rr, 4, initAngle))
      @addChild(cannon)
      @cannons.push cannon

    @

  step: ->
    @obstacle.step()
    for cannon in @cannons
      cannon.step()

module.exports = MainStage
