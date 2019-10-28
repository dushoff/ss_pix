# ss_pix: a screens project directory
## makestuff/project.Makefile
## Speed and strength pix

current: target
-include target.mk

# include makestuff/perl.def

######################################################################

## Cribbed from http://lalashan.mcmaster.ca/theobio/mmed/index.php/SIR_math_intro
## That's a useful resource, but this is probably not the picture we want.

Sources += $(wildcard *.R)
endemic.Rout: endemic.R

## Functions for calculating strength-speed stuff that I don't currently understand
kernel.Rout: kernel.R

## HIV parameters 
hss.Rout: HIVfuns.Rout kernel.Rout hss.R

## Old plots (generations and interventions using medium proportion)
## Note, cex needs to be reset after mfrow in intPlot.
HIVmed.Rout: hss.Rout par.R HIVmed.R
	$(run-R)

## New plots
HIVkernel.Rout: hss.Rout par.R HIVkernel.R
	$(run-R)

## Ebola parameters (still has plots)
ess.Rout: EbolaFuns.Rout kernel.Rout par.R ess.R

######################################################################

## Scenario plots
%.scen.Rout: %.Rout par.R HIVscen.R
	$(run-R)

## Parameters for test and treat
test.Rout: hss.Rout test.R
test.scen.Rout: HIVscen.R

## Parameters for condom
flat.Rout: hss.Rout flat.R
flat.scen.Rout: HIVscen.R

######################################################################

vim_session:
	bash -cl "vmt"

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/wrapR.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk

