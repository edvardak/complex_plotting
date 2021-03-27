# # Optional: installation
# using Pkg
# Pkg.add("Plots")

## Imports
using Plots

## Range selection
re_upper = 3
re_lower = -3
im_upper = 3
im_lower = -3
step = 0.01
x=re_lower:step:re_upper
y=im_lower:step:im_upper

## Plotting
# https://techytok.com/lesson-plotting/

z(x,y) = min(abs(exp(inv(complex(x,y)))),4)
plotly()
surface(x,y,z, size = (700, 600))
savefig("e_z_inv.html")