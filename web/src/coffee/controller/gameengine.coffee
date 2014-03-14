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

  addObstacleAtPoint: (x, y) ->
    obst = new Obstacle(x, y, {x: 0, y: 1})
    @obstacles.push obst

  shotTo: (x, y) ->
    for cannon in @cannons
      bullet = cannon.shotTo(x, y)
      if bullet?
        @bullets.push bullet

  step: ->
    for cannon in @cannons
      cannon.step()
    for obst in @obstacles
      obst.step()

module.exports = GameEngine