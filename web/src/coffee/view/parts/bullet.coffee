CircleShape = require('./shape').CircleShape

class Bullet extends CircleShape
  constructor: (@model) ->
  	super @model.x, @model.y, 5

  update: ->
    if ! @model?
      return

    @position.x = @model.x
    @position.y = @model.y

module.exports = Bullet