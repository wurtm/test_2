import matplotlib.pyplot as plt
import numpy as np

n = 3 #number of petals of the rose

theta = np.linspace(0, 2*np.pi, 1000)
r = np.sin(n * theta)

x = r * np.sin(theta)
y = r * np.cos(theta)

fig, ax = plt.subplots(figsize=(5,5))
ax.plot(x,y, "b")
ax.axis('off')
fig.savefig("rose_curve2.svg", transparent=True)