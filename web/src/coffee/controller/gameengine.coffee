RoundCannon = require('../model/roundcannon')
{Obstacle, Bullet} = require('../model/straightobject')

class GameEngine
  constructor: ->
    @initialize()

  initialize: ->
    CannonConfig = window.RHConfig.Cannon
    x = CannonConfig.Orbit.X
    y = CannonConfig.Orbit.Y
    r = CannonConfig.Orbit.Radian
    s = CannonConfig.Rotate

    @cannons = []
    for initAngle in [90, 270]
      cannon = new RoundCannon(x, y, r, s, initAngle)
      @cannons.push cannon

    @obstacles = []
    @bullets = []
    @newBullets = []

  addObstacleAtPoint: (x, y) ->
    obst = new Obstacle(x, y, {x: 0, y: 1})
    @obstacles.push obst

  shotTo: (x, y) ->
    for cannon in @cannons
      bullet = cannon.shotTo(x, y)
      if bullet?
        @bullets.push bullet
        @newBullets.push bullet
    return (@newBullets.length > 0)

  step: ->
    for cannon in @cannons
      cannon.step()
    for obst in @obstacles
      obst.step()
    for bullet in @bullets
      bullet.step()

  clearStep: ->
    @newBullets = []

module.exports = GameEngine