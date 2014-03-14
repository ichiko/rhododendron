class RoundCannon
  # @param x,y center of goround circle
  constructor: (@center_x, @center_y, @radius, @rotation, initialAngle = 0)->
    @setAngle(initialAngle)

  setAngle: (angle) ->
    @angle = angle
    @updatePosition()

  step: ->
    @angle += @rotation
    @updatePosition()

  updatePosition: ->
    @radian = @angle * Math.PI / 180;
    x = @center_x + Math.cos(@radian) * @radius
    y = @center_y + Math.sin(@radian) * @radius

    @x = x
    @y = y

module.exports = RoundCannon
