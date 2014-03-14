BoxShape = require('./shape').BoxShape

class Obstacle extends BoxShape
  constructor: (@model) ->
    super @model.x, @model.y, 15, 15

  update: ->
    if ! @model?
      return

    @setPosition(@model.x, @model.y)

module.exports = Obstacle
