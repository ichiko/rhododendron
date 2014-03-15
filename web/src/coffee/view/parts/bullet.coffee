CircleShape = require('./shape').CircleShape

class Bullet extends CircleShape
  constructor: (@model) ->
     super @model.x, @model.y, window.RHConfig.Bullet.Radian

  update: ->
    if ! @model?
      return false

    if ! @model.life
      return false

    @position.x = @model.x
    @position.y = @model.y

    return true

module.exports = Bullet