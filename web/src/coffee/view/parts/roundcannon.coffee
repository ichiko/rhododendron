CircleShape = require('./shape').CircleShape

class RoundCannon extends CircleShape
  constructor: (@model) ->
    super @model.x, @model.y, 10, 0xffffff

  step: ->
    if ! @model?
      return

    @model.step()

    @position.x = @model.x
    @position.y = @model.y
    #@rotation = @model.radian

module.exports = RoundCannon
