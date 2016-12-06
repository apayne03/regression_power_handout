# 1 - POWER ANALYSIS: WHEN YOU KNOW THE POPULATION R2

## You want to run a multiple regression study in an existing research area using 3 predictors.
## A past study, N = 100, found an R2 = .20.
## How many people do you need in your study to have 80% power for the overall regression equation (i.e., R2)?

## We need to determine 2 pieces of info to proceed:
## 1) The effect size as f2 instead of R2
## 2) The degrees of freedom for the predictors
## We use these 2 pieces of info in the pwr command


# 1.1 - Determining f2...

my.f2 <- .20 / (1 - .20)
print(my.f2) # Thus, f2 = .25


# 1.2 - Determine degrees of freedom (for the original study)...

# Degrees of Freedom Predictors: u = number of predictors = 3


# 1.3 - Calculate power...

library(pwr)
pwr.f2.test(u=3, f2=.25, power=.80)
# What does this output mean? It provides us with the degrees of freedom error (i.e., v) for your study (not the original study). 
# We need to use the degrees of freedom error to calculate the N needed.

# Degrees of Freedom Error: v = N - u - 1 therefore N = u + v + 1
# We know u = 3. Our power analysis revealed we need v = 44 in our study.
# Therefore N = u + v + 1 = 3 + 44 + 1 
N = 3 + 44 + 1
print(N)
# Thus, we want an N of 48 in our study.



# 2 - SAFEGUARD POWER ANALYSIS: WHEN YOU ONLY HAVE AN ESTIMATE OF THE POPULATION R2

## You want to run a multiple regression study in an existing research area using 3 predictors. 
## A past study, N = 100, found an R2 = .20. 
## How many people do you need in your study to have 80% power for the overall regression equation (i.e., R2)?

## As before, it's better to use the lower bound of the CI when calculating power; even with multiple regression.


# 2.1 - Calculate CI for R2...

## To calculate the CI for R2 we need to input R2, the number of predictors (p), and the sample size (N).
## We need the MBESS package for the calculations.

library(MBESS)
ci.R2(R2=.20, p=3, N=100, Random.Predictors = FALSE)
# Thus, R2 = .20, 95% CI [.06, .32].


# 2.2 - Determining f2...

## We need to represent the lower bound of the CI as f2.

my.f2 <- 0.0596 / (1 - 0.0596)
print(my.f2)
# Thus, R2 = 0.0596 can be expressed as f2 = 0.06338.


# 2.3 - Degrees of freedom predictors...

## We know from before that 3 predictors means 3 degrees of freedom (i.e., u=3).


# 2.4 - Calculate power...

library(pwr)
pwr.f2.test(u=3, f2=0.06338, power = .80)

## We then calculate N = u + v + 1
N = 3 + 172 + 1
print(N)

## Thus, a safeguard N for your study is 176. 
## Notice how low the non-safeguard N of 48 for the overal R2 is in comparison!


# 3 - POWER ANALYSIS: INCREMENTAL PREDICTION IN MULTIPLE REGRESSION

## You want to run a multiple regression study in an existing research area using 3 predictors. 
## A past tudy, N = 100, found an R2 = .20. 
## You think that one key predictor will account for 2% of the variance in the criterion above and beyond the other 2 predictors.
## What sample size do you need to ensure you have power of .80 for detecting this increment in variance.
## Note: this is the most common scenario you will encounter!

## Your (safeguard) power analysis revealed you need an N of 176.

## However, you have a more specific hypothesis than just the overall R2 value. 
## That is, you think that one key predictor will account for 2% of the variance in the criterion above and beyond the other 2 predictors (i.e., sr2=.02).
## Said another way, you believe .02 of the .20 will be a result of the unique contribution of one predictor.

## If you think in terms of SPSS blocks: Predictors A and B are in Block 1 where overall R2 = .18.
## Block 2 contains predictor C.
## The overall R2 for Blcoks 1 and 2 combined is .20.
## The Delta R2 is .02 for Block 2. 

## Conduct a power analysis to determine how many people you need to ensure power of 80% for this incremental prediction effect.


# 3.1 - Determine degrees of freedom...

## We are interested in the incremental prediction of one variable so u = 1.


# 3.2 - Determine f2...

## We know sr2 = .02 and R2 = .20. We can use these to compute the needed f2:
my.f2 <- .02 / (1 - .20)
print(my.f2)


# 3.4 - Calculate power...

pwr.f2.test(u=1, f2=0.025, power=.80)
## Thus, degrees of freedom error (i.e., v) is 314.
## We then calculate N = u + v + 1
N = 1 + 314 + 1
print(N)

## Thus, you need an N of 316!