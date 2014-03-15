BoxShape = require('./shape').BoxShape

class Obstacle extends BoxShape
  constructor: (@model) ->
    super @model.x, @model.y, 15, 15

  update: ->
    if ! @model?
      return false

    if ! @model.life
      return false

    @setPosition(@model.x, @model.y)

    return true

module.exports = Obstacle
