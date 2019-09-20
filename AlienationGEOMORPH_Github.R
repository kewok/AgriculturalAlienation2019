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

# Generate TPS deformation grids for each year and by axis:
pdf(file="TPSGrids.pdf",height=9)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,1],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2762,"1970 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,1],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2269,"1970 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,2],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2872,"1975 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,2],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2269,"1975 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,3],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(-0.1351,0.2972,"1980 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,3],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(0.2682,0.2269,"1980 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,4],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(-0.1351,0.2972,"1985 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,4],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.3069,"1985 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,5],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2572,"1990 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,5],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2969,"1990 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,6],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2972,"1995 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,6],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2269,"1995 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,7],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2972,"2000 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,7],method="TPS",label=TRUE,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2269,"2000 Y,Z tps",cex=2)
dev.off()

# Generate annual TPS grids without labels
pdf(file="TPSGrids_v2NoLabels.pdf",height=9)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,1],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2762,"1970 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,1],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2269,"1970 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,2],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2872,"1975 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,2],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2269,"1975 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,3],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(-0.1351,0.2972,"1980 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,3],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(0.2682,0.2269,"1980 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,4],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(-0.1351,0.2972,"1985 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,4],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.3069,"1985 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,5],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2572,"1990 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,5],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2969,"1990 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,6],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(0.1351,0.2972,"1995 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,6],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
text(-0.2682,0.2269,"1995 Y,Z tps",cex=2)
plotRefToTarget(proc_fits$consensus[,1:2],proc_fits$coords[,1:2,7],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
#text(0.1351,0.2972,"2000 X,Y tps",cex=2)
plotRefToTarget(proc_fits$consensus[,2:3],proc_fits$coords[,2:3,7],method="TPS",label=F,gridPars=gridPar(grid.col="GREY"))
#text(-0.2682,0.2269,"2000 Y,Z tps",cex=2)
dev.off()

# Determine the relative warp scores
state_RW <- relWarps(proc_fits$coords, alpha=0)

# Print their share of the data variance explained
state_RW$Var

# Project each specimen on ordination space
plot(state_RW$bescores[,1],state_RW$bescores[,2],ylim=c(-0.175,0.11),xlab="Relative warp 1", ylab="Relative warp 2")
text(state_RW$bescores[,1],state_RW$bescores[,2]-0.01,c(1970,1975,1980,1985,1990,1995,2000))


# Regress shigellosis and salmonella on the relative warp scores:
summary(lm(preds[,2]~state_RW$bescores[,1]+state_RW$bescores[,2]+state_RW$bescores[,3]))
summary(lm(preds[,2]~state_RW$bescores[,1]+state_RW$bescores[,2]+state_RW$bescores[,3]+state_RW$bescores[,4]+state_RW$bescores[,5]))

summary(lm(preds[,3]~state_RW$bescores[,1]+state_RW$bescores[,2]+state_RW$bescores[,3]))
summary(lm(preds[,3]~state_RW$bescores[,1]+state_RW$bescores[,2]+state_RW$bescores[,3]+state_RW$bescores[,4]+state_RW$bescores[,5]))

# Examine the trend between relative warp two and salmonella incidence
plot(state_RW$bescores[,2], preds[,2],ylab="Size of Salmonella outbreak",xlab="Relative warp 2 score")
text(-0.1584,27.0397,"1985")
text(-0.0115,19.2174,"1990")
text(-0.0574,14.485,"1980")
text(0.0708,17.7703,"1995")
text(0.0504,14.2894,"2000")
text(-0.0217,11.0823,"1975")
text(0.0913,11.1214,"1970")
dev.off()



