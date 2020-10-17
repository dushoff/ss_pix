logR0 <- seq(log(0.5), log(8), length.out=200)
R0 <- exp(logR0)
V <- 1-1/R0
V <- ifelse(V<0, 0, V)
plot(R0, V, type="l", log="x")
