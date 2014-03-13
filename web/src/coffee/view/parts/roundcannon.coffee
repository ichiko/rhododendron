class RoundCannon extends PIXI.DisplayObjectContainer
  constructor: (@model) ->
    super

  initialize: ->

    color = 0xffffff
    graph = new PIXI.Graphics()
    graph.lineStyle(1, color, 1)
    graph.drawCircle(@model.center_x, @model.center_y, @model.radius)
    @addChild(graph)

    texture = PIXI.Texture.fromImage("image/cannon.png")
    cannon = new PIXI.Sprite(texture)
    cannon.anchor = new PIXI.Point(0.5, 0.5)
    @addChild(cannon)
    @cannon = cannon

    @

  step: ->
    if ! @model?
      return

    @model.step()

    @cannon.position.x = @model.x
    @cannon.position.y = @model.y
    @cannon.rotation = @model.radian + 0.5 * Math.PI

module.exports = RoundCannon
