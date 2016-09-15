import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


x= np.linspace(-40,40,100)
y= np.linspace(-40,40,100)

X,Y= np.meshgrid(x,y)
R=np.sqrt(X**2 + Y**2)
Z=np.sin(R)




fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.plot_surface(X,Y,Z,rstride=4,cstride=2,color='r')
plt.show()


# 
# x = np.arange(-5, 5, 0.1)
# y = np.arange(-5, 5, 0.1)
# xx, yy = meshgrid(x, y, sparse=True)
# z = np.sin(xx**2 + yy**2) / (xx**2 + yy**2)
# h = plt.contourf(x,y,z)
