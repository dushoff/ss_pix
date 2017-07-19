
r <- 1/24
bProp <- 0.25

g <- EbolaGen(bProp=bProp)
scen <- list(disease="Ebola", unit="days")

R <- r2R(g, r=r)
print(R)

Rrplot(g, R, scen)

