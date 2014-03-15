Obstacle = require('./parts/obstacle')
Bullet = require('./parts/bullet')
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

    @obstacle = new Obstacle(@gameEngine.obstacles[0])
    @addChild(@obstacle)

    @cannons = []
    for cannonModel in @gameEngine.cannons
      cannon = new RoundCannon(cannonModel)
      @addChild(cannon)
      @cannons.push cannon

    @bullets = []

    @

  update: ->
    @obstacle.update()
    for cannon in @cannons
      cannon.update()

    rmidx = []
    for i in [0...@bullets.length]
      bullet = @bullets[i]
      if ! bullet.update()
        rmidx.push i
    if rmidx.length > 0
      for i in [rmidx.length - 1..0]
        idx = rmidx[i]
        @removeChild(@bullets[idx])
        @bullets.splice(idx, 1)

    newBullets = @gameEngine.newBullets
    for bulletModel in newBullets
      bullet = new Bullet(bulletModel)
      @addChild(bullet)
      @bullets.push bullet

module.exports = MainStage
