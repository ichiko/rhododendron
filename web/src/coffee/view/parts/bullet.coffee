CircleShape = require('./shape').CircleShape

class Bullet extends CircleShape
  constructor: (@model) ->
	super @model.x, @model.y, window.RHConfig.Bullet.Radian

  update: ->
    if ! @model?
      return

    @position.x = @model.x
    @position.y = @model.y

module.exports = Bullet