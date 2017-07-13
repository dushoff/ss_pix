
hivAlt <- as.data.frame(t(sapply(epRange, function(ep){
	g <- HIVgen(earlyProp=ep)
	b0 <- b0fun(g, r)
	R <- r2R(g, r)
	the <- theFun(g, LH)
	phi <- phiFun(b0, LH)

	if((ep==min(epRange)) | (ep==max(epRange))){
		with(LH, {
			dualPlot(time, interv=strength
				, intname="strength", gen=g
				, stat=the, dtype="Intrinsic"
			)
			dualPlot(time, interv=hazRate
				, intname="Hazard rate", gen=b0
				, stat=phi, dtype="Backward"
			)
		})
	}
	return(c(ep, r, R, the, phi))
})))

names(hivAlt) <- c("ep", "r", "R", "the", "phi")

with(hivAlt, {
	plot(ep, the
		, xlab = "Early Proportion"
		, ylab = "Strength"
		, ylim = c(0, max(c(the, R)))
		, type = "l", col="blue"
	)
	lines(ep, R, type="l")
})

with(hivAlt, {
	plot(ep, phi
		, xlab = "Early Proportion"
		, ylab = "Speed"
		, ylim = c(0, max(c(phi, r)))
		, type = "l", col="blue"
	)
	lines(ep, r, type="l")
})


