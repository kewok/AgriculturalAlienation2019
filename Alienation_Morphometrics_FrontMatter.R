require(geomorph)
require(shapes)
require(Morpho)
require(car)
require(Hmisc)

n_sites <- 26

# Landmark data for each year:

coordinates <- read.table("Year_by_Landmarks.txt")

# The outbreak data; see main text for sources.
preds <- cbind(c(1970,1975,1980,1985,1990,1995,2000), c(10.7758032109,	10.4698272469,	14.8377159203,	27.4654931827,	19.4705616069,	17.263912152,	14.0253055369), c(6.7519458479,	7.67873762,	8.3797997579	,7.1690960139,	20.1195402667,	12.0475593177,	8.1237189447) )
colnames(preds) <- c("time", "salm.", "shig.")

# The following data points require working with :
state_LM <- arrayspecs(coordinates,n_sites -1, 3)

proc_fits <- gpagen(state_LM, PrinAxes=F)
