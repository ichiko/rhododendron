class _StraightObject
  constructor: (@x, @y, @vec, @speed = 1) ->
    @life = true
    @setPosition(@x, @y)

  setPosition: (@x, @y) ->
    @_x = @x
    @_y = @y

  step: ->
    @_x += @vec.x * @speed
    @_y += @vec.y * @speed
    @x = Math.floor(@_x)
    @y = Math.floor(@_y)
    @checkBounds()

  checkBounds: ->
    Bounds = window.RHConfig.Screen.Bounds
    if (@x < Bounds.Left || @x > Bounds.Right) || (@y < Bounds.Top || @y > Bounds.Bottom)
      @life = false

class Obstacle extends _StraightObject
  constructor: (x, y, vec, speed = 1) ->
    super x, y, vec, speed

class Bullet extends _StraightObject
  constructor: (x, y, vec, speed = 1) ->
    super x, y, vec, speed

exports.Obstacle = Obstacle
exports.Bullet = Bullet
