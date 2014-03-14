WIDTH = 320
HEIGHT = 450

RHConfig = {
  Screen:
    Width: WIDTH
    Height: HEIGHT
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