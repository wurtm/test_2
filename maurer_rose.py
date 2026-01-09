import matplotlib.pyplot as plt
import numpy as np

n = 3 #number of petals of the rose
d = 90 #in degrees
xs = []
ys = []

for i in range(0,360,1):
      theta = i * (d*np.pi/180)
      r = np.sin(n*theta)

      xs.append(r * np.sin(theta))
      ys.append(r * np.cos(theta))

fig, ax = plt.subplots(figsize=(5,5))
ax.plot(xs,ys, "b")
ax.axis('off')
ax.set_title(f"n = {n} | d = {d}")
fig.savefig("rose.svg", transparent=True)