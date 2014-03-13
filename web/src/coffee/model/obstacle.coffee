class Obstacle
  constructor: (@depth, @speed) ->
    @x = @y = 0

  setPosition: (@x, @y) ->

  step: ->
    if (@depth < Obstacle.MaximumDepth)
      @depth += @speed
    return (@depth < Obstacle.MaximumDepth)

Obstacle.MinimunDepth = 0
Obstacle.MaximumDepth = 100

module.exports = Obstacle
