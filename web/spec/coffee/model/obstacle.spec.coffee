Obstacle = require('../../../src/js/model/obstacle')

describe 'Obstacle', ->
  describe '更新', ->
    it 'Stepにより深度が変わる', ->
      obj = new Obstacle(10, 3)
      expect(obj.depth).toEqual(10)
      obj.step()
      expect(obj.depth).toEqual(10 + 3)

  describe '限界深度のチェック', ->
    beforeEach ->
      Obstacle.MaximumDepth = 100

    it '限界深度を越えないとき、trueを返す', ->
      obj = new Obstacle(98, 1)
      expect(obj.step()).toBe(true)

    it '限界深度を越えるとき、falseを返す', ->
      obj = new Obstacle(99, 1)
      expect(obj.step()).toBe(false)
