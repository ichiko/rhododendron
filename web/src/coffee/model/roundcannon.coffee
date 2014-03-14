Bullet = require('./straightobject').Bullet

class RoundCannon
  # @param x,y center of goround circle
  constructor: (@center_x, @center_y, @radius, @rotation, initialAngle = 0)->
    @setAngle(initialAngle)

  setAngle: (angle) ->
    @angle = angle
    @updatePosition()

  shotTo: (x, y) ->
    now = @getTime()
    if @enableShot(now)
      @prevTime = now
      vec_x = x - @x
      vec_y = y - @y
      denom = Math.sqrt(vec_x * vec_x + vec_y * vec_y) / window.RHConfig.Cannon.Shot.VectorMulti
      vec = {x: vec_x / denom, y: vec_y / denom}
      shotPositionMulti = window.RHConfig.Cannon.Shot.StartPointMulti
      x = @x + vec.x * shotPositionMulti
      y = @y + vec.y * shotPositionMulti
      return new Bullet(x, y, vec)
    return null

  enableShot: (now) ->
    if (! @prevTime?) || (now - @prevTime > window.RHConfig.Cannon.Interval)
      return true
    return false

  getTime: ->
    return (+new Date())

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
