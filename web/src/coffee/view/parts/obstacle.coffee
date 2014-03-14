BoxShape = require('./shape').BoxShape

class Obstacle extends BoxShape
  constructor: (@model) ->
    super @model.x, @model.y, 15, 15

  step: ->
    if ! @model?
      return

    if ! @model.step()
      return

    @setPosition(@model.x, @model.y)

module.exports = Obstacle
