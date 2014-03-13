class Obstacle extends PIXI.DisplayObjectContainer
  constructor: (@model) ->
    super

  initialize: ->
    color = 0xffffff
    graph = new PIXI.Graphics()
    graph.beginFill(color)
    graph.lineStyle(1, color, 1)
    graph.drawCircle(100, 200, 10)
    graph.endFill()

    @addChild(graph)
    @graph = graph

    @

  step: ->
    if ! @model?
      return

    if ! @model.step()
      return

    @graph.clear()
    color = 0xffffff
    @graph.beginFill(color, 0.2 + Math.sqrt(@model.depth) / 12)
    @graph.lineStyle(1, color, 1)
    @graph.drawCircle(100, 200, @model.depth / 2)
    @graph.endFill()



module.exports = Obstacle
