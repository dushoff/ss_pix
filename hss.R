
par(cex=1.6)
earlyProp=1/3
r = 1/18
maxRate <- 1/6
flatMult <- 1.12
epRange <- seq(0.1, 0.4, length.out=13)

g <- HIVgen(earlyProp=mean(epRange))
scen <- list(disease="HIV", unit="months")

R <- r2R(g, r=r)
Rrplot(g, R, scen)
flatL <- flatMult*R

with(flatFun(flatL), intPlot(time, g$density, strength, R))
with(testingFun(maxRate), intPlot(time, g$density, strength, R))

