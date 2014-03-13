MObstacle = require('../model/obstacle')
Obstacle = require('./parts/obstacle')

MRoundCannon = require('../model/roundcannon')
RoundCannon = require('./parts/roundcannon')

class MainStage extends PIXI.Stage
  constructor: (@width, @height)->
    super

  initialize: ->
    text = new PIXI.Text('Rhododendron', {fill: 'white'})
    text.anchor = new PIXI.Point(0.5, 0.5)
    text.position.x = @width / 2
    text.position.y = 30
    @addChild(text)

    @obstacle = new Obstacle(new MObstacle(10, 5)).initialize()
    #@addChild(@obstacle)

    rx = @width / 2
    ry = @height - 100
    @cannon = new RoundCannon(new MRoundCannon(rx, ry, 80, 5)).initialize()
    @addChild(@cannon)

    @

  step: ->
    @obstacle.step()
    @cannon.step()

module.exports = MainStage
