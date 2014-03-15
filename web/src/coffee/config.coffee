WIDTH = 320
HEIGHT = 450

RHConfig = {
  Screen:
    Width: WIDTH
    Height: HEIGHT
    Bounds:
      Left: -10
      Top: -10
      Right: WIDTH + 10
      Bottom: HEIGHT + 10
  Cannon:
   	Orbit:
   	  X: WIDTH / 2
      Y: HEIGHT - 100
      Radian: 50
    Rotate: 5
    Interval: 200
    Radian: 10
    Shot:
      StartPointMulti: 10
      VectorMulti: 2
  Bullet:
    Radian: 3
}

window.RHConfig = RHConfig