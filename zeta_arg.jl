## Optional: installation
# using Pkg
# Pkg.add("Plots")
# Pkg.add("SpecialFunctions")

## Imports
using Plots

## Range selection
re_upper = 5
re_lower = -1
im_upper = 50
im_lower = -50
step = 0.1
x=re_lower:step:re_upper
y=im_lower:step:im_upper

## Function definitions
# See http://numbers.computation.free.fr/Constants/Miscellaneous/zetaevaluations.pdf section 1.2 for the algorithm used here.

function e(k,n)
    sum([binomial(n,j) for j in k:n])
end

function alt_series_zeta(s; n=20)
    first_term = sum([((-1)^(k-1))/(k^s) for k in 1:n])
    second_term = inv(2^n)*sum([((-1)^(k-1)*e(k-n,n))/(k^s) for k in (n+1):2n])
    return inv(1-2^(1-s))*(first_term+second_term)
end

## Plotting
# https://techytok.com/lesson-plotting/

plotly()
zeta_abs(x,y)= min(abs(alt_series_zeta(complex(x,y))),2)
zeta_arg(x,y)= rad2deg(angle(alt_series_zeta(complex(x,y))))
# length = (size(x)[1], size(y)[1])

arguments = [zeta_arg(a,b) for a in x, b in y]
arguments = replace(arguments, NaN=>0) # NaN => missing
col = trunc.(Int,arguments)

surface(x,y,zeta_abs) # ,color=col, colorscale="YlGnBu")
plot!(xlab=raw"x", ylab="y", zlab="min( |zeta(x+iy)|, 2 )")

savefig("zeta.html")


z(x,y) = min(abs(exp(inv(complex(x,y)))),2)
plotly()
surface(x,y,z)
savefig("e_z_inv.html")