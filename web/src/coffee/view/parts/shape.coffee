class _Shape extends PIXI.Graphics
	constructor: (@width, @height) ->
    super
    @anchor = new PIXI.Point(0.5, 0.5)

  setPosition: (x, y) ->
    @position.x = x - @width * @anchor.x
    @position.y = y - @height * @anchor.y

  setAnchor: (anchor) ->
    prevAnchor = @anchor
    @anchor = anchor
    prev_x = @position.x + @width * prevAnchor.x
    prev_y = @position.y + @height * prevAnchor.y
    @setPosition(prev_x, prev_y)

class CircleShape extends _Shape
  constructor: (x, y, @radi, color = 0xffffff) ->
    super @radi * 2, @radi * 2
    @draw(color)
    @setPosition(x, y)

  draw: (color) ->
    @beginFill(color)
    @lineStyle(1, color, 1)
    @drawCircle(0, 0, @radi)
    @endFill()

class BoxShape extends _Shape
  constructor: (x, y, width, height, color = 0xffffff) ->
    super width, height
    @draw(width, height, color)
    @setPosition(x, y)

  draw: (width, height, color) ->
    @beginFill(color)
    @lineStyle(1, color, 1)
    @drawRect(0, 0, width, height)
    @endFill()

class TriangleShape extends _Shape
  constructor: (x, y, width, height, color = 0xffffff) ->
    super width, height
    @draw(width, height, color)
    @setPosition(x, y)

  draw: (width, height, color) ->
    @beginFill(color)
    @lineStyle(1, color, 1)
    @moveTo(0, -height / 2)
    @lineTo(width / 2, height / 2)
    @lineTo(-width / 2, height / 2)
    @lineTo(0, -height / 2)
    @endFill()

exports.CircleShape = CircleShape
exports.BoxShape = BoxShape
exports.TriangleShape = TriangleShape