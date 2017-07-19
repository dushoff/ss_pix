
par(cex=1.6)
r = 1/18
maxRate <- 1/6
flatMult <- 1.12
lowprop <- 0.1
highprop <- 0.4

epRange <- seq(0.1, 0.4, length.out=13)
medprop <- mean(epRange)

## Not clear why these are needed here; panicking in Salt Lake
g <- HIVgen(earlyProp=medprop)
scen <- list(disease="HIV", unit="months")
R <- r2R(g, r=r)
flatL <- flatMult*R
