class TitleLayer extends PIXI.DisplayObjectContainer
  constructor: ->
    super
    @initialize()

  initialize: ->
    title = new PIXI.Text('Rhododendron', {fill: 'white'})
    title.anchor = new PIXI.Point(0.5, 0.5)
    title.position.x = window.RHConfig.Screen.Width / 2
    title.position.y = 30
    @addChild(title)

module.exports = TitleLayer