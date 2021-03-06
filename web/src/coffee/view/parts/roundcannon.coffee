CircleShape = require('./shape').CircleShape

class RoundCannon extends CircleShape
  constructor: (@model) ->
    super @model.x, @model.y, window.RHConfig.Cannon.Radian

  update: ->
    if ! @model?
      return

    @position.x = @model.x
    @position.y = @model.y
    #@rotation = @model.radian

module.exports = RoundCannon
