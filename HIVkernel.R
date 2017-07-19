scen <- list(disease="Transmission kernel", unit="months")

for(prop in c(lowprop, medprop, highprop)){
	g <- HIVgen(earlyProp=prop)
	R <- r2R(g, r=r)
	with(g, { densPlot(time, R*density, scen, ymax=0.35)})
}



