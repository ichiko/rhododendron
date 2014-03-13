class MainStage extends PIXI.Stage
  constructor: (@width, @height)->
    super

  initialize: ->
    text = new PIXI.Text('RhodoDendron', {fill: 'white'})
    text.anchor = new PIXI.Point(0.5, 0.5)
    text.position.x = @width / 2
    text.position.y = @height / 2
    @addChild(text)
    @

module.exports = MainStage
