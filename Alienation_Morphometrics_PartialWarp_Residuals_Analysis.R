source('Alienation_Morphometrics_FrontMatter.R')

pw <- procGPA(state_LM, alpha=1)
# Determine the proportion of variability in the deformation from the mean shape explained by the five most important partial warps
sum(pw$partialwarps.percent[which(rank(pw$partialwarps.percent)>16)])

# Partial warp scores to analyze are:
examine <- which(rank(pw$partialwarps.percent)>16)

inputs <- pw$partialwarpscores[,,examine[1]]
salms <- summary(lm(preds[,2]~inputs))$coefficients[2:4,4]
shigs <- summary(lm(preds[,3]~inputs))$coefficients[2:4,4]

f_salms <- c(summary(lm(preds[,2]~inputs))$fstatistic, pf(summary(lm(preds[,2]~inputs))$fstatistic[1], summary(lm(preds[,2]~inputs))$fstatistic[2], summary(lm(preds[,2]~inputs))$fstatistic[3]))
f_shigs <- c(summary(lm(preds[,3]~inputs))$fstatistic, pf(summary(lm(preds[,3]~inputs))$fstatistic[1], summary(lm(preds[,3]~inputs))$fstatistic[2], summary(lm(preds[,3]~inputs))$fstatistic[3]))

for (i in 2:5)
	{
	inputs <- pw$partialwarpscores[,,examine[i]]
	salms <- c(salms, summary(lm(preds[,2]~inputs))$coefficients[2:4,4])
	f_salms <- rbind(f_salms, c(summary(lm(preds[,2]~inputs))$fstatistic, pf(summary(lm(preds[,2]~inputs))$fstatistic[1], summary(lm(preds[,2]~inputs))$fstatistic[2], summary(lm(preds[,2]~inputs))$fstatistic[3])))
	shigs <- c(shigs, summary(lm(preds[,3]~inputs))$coefficients[2:4,4])
	f_shigs <- rbind(f_shigs, c(summary(lm(preds[,3]~inputs))$fstatistic, pf(summary(lm(preds[,3]~inputs))$fstatistic[1], summary(lm(preds[,3]~inputs))$fstatistic[2], summary(lm(preds[,3]~inputs))$fstatistic[3])))
	}

p.adjust(f_salms[,4])
p.adjust(f_shigs[,4])

# Procrustes residuals
for (i in 2:5)
	{
	inputs <- pw$partialwarpscores[,,examine[i]]
	A <- procD.lm(preds[,2]~inputs,iter=1e4)
	B <- procD.lm(preds[,3]~inputs,iter=1e4)
	print(summary(A))
	print(summary(B))
	}
