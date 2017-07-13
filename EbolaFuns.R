EbolaGen <- function(bProp
	, dtime = 11 , dshape = 4
	, itime = 2 , ishape = 2
	, btime = 6 , bshape = 4
	, step = 0.25, window=40
){
	pretime <- seq(0, window, by=step)
	d <- dgamma(pretime, shape=dshape, scale=dtime/dshape)
	i <- (
		(1-bProp)*dgamma(pretime, shape=ishape, scale=itime/ishape)
		+ bProp*dgamma(pretime, shape=bshape, scale=btime/bshape)
	)

	g0 <- c()
	time <- seq(step, window, by=step)
	for (tp in 1:length(time)){
		dp <- seq(1, tp+1)
		ip <- 2+tp-dp
		g0[[tp]] <- sum(d[dp]*i[ip])
	}

	return(data.frame(time
		, density=g0/(step*sum(g0))
	))
}


