Obstacle = require('./parts/obstacle')
RoundCannon = require('./parts/roundcannon')
TitleLayer = require('./parts/titleLayer')

class MainStage extends PIXI.Stage
  constructor: (@gameEngine) ->
    super

  initialize: ->
    @addChild(new TitleLayer())

    CannonConfig = window.RHConfig.Cannon
    rx = CannonConfig.Orbit.X
    ry = CannonConfig.Orbit.Y
    rr = CannonConfig.Orbit.Radian

    circle = new PIXI.Graphics()
    circle.lineStyle(1, 0xa0a0a0, 1)
    circle.drawCircle(rx, ry, rr)
    @addChild(circle)

    console.log @gameEngine.obstacles

    @obstacle = new Obstacle(@gameEngine.obstacles[0])
    @addChild(@obstacle)

    @cannons = []
    for cannonModel in @gameEngine.cannons
      cannon = new RoundCannon(cannonModel)
      @addChild(cannon)
      @cannons.push cannon

    @

  update: ->
    @obstacle.update()
    for cannon in @cannons
      cannon.update()

module.exports = MainStage
