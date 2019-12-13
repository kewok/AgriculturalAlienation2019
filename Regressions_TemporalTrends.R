df <- as.data.frame(read.table('Transformed_Data.txt'))
require(car)
require(lme4)
require(nlme)
# GLM model
noran <- gls(h~year*n + year*i,data=df)

# Model with state as random effect:
m1 <- lme(h~year*n+year*i, random=~+1|state,data=df)
# Test for state-level effects
anova(noran,m1)

# Model with temporal autocorrelation
m2 <- lme(h~year*n+year*i, random=~+1|state,data=df, cor=corAR1())

# Test for temporal autocorrelation in all variables 
anova(m1,m2)

# Model with no yearly trend in nature and no temporal autocorrelation
m3 <- lme(h~n+year*i, random=~+1|state,data=df, cor=corAR1())
m3_alt <- lme(h~n+year*i, random=~+1|state,data=df)
summary(m3)$AIC

# Test for temporal autocorrelation in all but n
anova(m3,m3_alt)

# Assess AIC of model with temporal autocorrelation and year x axis interaction
summary(m2)$AIC

# Model with no n
m4 <- lme(h~year*i, random=~+1|state,data=df, cor=corAR1())
# Test for removal of n altogether
summary(m4)$AIC

# Test for a nature - industry alienation relationship:
summary(lme(n~year*i,random=~+1|state,data=df,cor=corAR1()))

