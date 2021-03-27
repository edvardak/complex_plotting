# # Optional: installation
# using Pkg
# Pkg.add("Plots")

## Imports
using Plots

## Range selection
re_upper = 10
re_lower = -10
im_upper = 3
im_lower = -3
step = 0.05
x=re_lower:step:re_upper
y=im_lower:step:im_upper


function f(z)
    return sin(z)
end

## Plotting
# https://techytok.com/lesson-plotting/

plotly()

z(x,y) = log(1+abs(f(complex(x,y))))
# z(x,y) = f(complex(x,y))
plotly()
surface(x,y,z, size = (700, 600))
plot!(xlab=raw"x", ylab="y", zlab="ln(1+|f(x+iy)|)")
savefig("sin.html")