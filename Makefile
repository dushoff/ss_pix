# ss_pix
### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

## Crib

#  .PRECIOUS: %.R
#  %.R: ~/git/dushoff.github.io/%.R
#	  $(copy)

##################################################################

## Content

Sources += $(wildcard *.R)

## Cribbed from http://lalashan.mcmaster.ca/theobio/mmed/index.php/SIR_math_intro
## That's a useful resource, but this is probably not the picture we want.
endemic.Rout: endemic.R

## Functions for calculating strength-speed stuff that I don't currently understand
kernel.Rout: kernel.R

hss.Rout: HIVfuns.Rout kernel.Rout hss.R
ess.Rout: EbolaFuns.Rout kernel.Rout ess.R

## Parameters for test and treat
test.Rout: hss.Rout test.R
test.scen.Rout:

## Parameters for condom
flat.Rout: hss.Rout flat.R
flat.scen.Rout: 

## Make scenario plots
%.scen.Rout: %.Rout HIVscen.R
	$(run-R)


## Parameters for condom
condom.scen.Rout: condom.R

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
