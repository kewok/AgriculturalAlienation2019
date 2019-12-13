source('Alienation_Morphometrics_FrontMatter.R')

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


