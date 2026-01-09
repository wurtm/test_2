from svg_turtle import SvgTurtle
import numpy as np

t = SvgTurtle(700,700)
n = 3
d = 19
for angle in range(361):
      t.color("red")
      angle_rad = angle+1 * d * np.pi/180
      r = 300 * np.sin(n * angle_rad)
      x = r * np.sin(angle+1 * angle_rad)
      y = r * np.cos(angle+1 * angle_rad)
      t.goto(x,y)
t.save_as("rose.svg")