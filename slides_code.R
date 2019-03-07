##############################
## code use in presentation ##
##  credibility of science  ##
##      March 11 2019       ##
##  malika_ihle@hotmail.fr  ##
##############################

#~~~~~~~~~ Random Numbers Generators and sampling theory

# sample 
## x is a sequence
x <- 1:10
x
sample(x)
sample(x, replace = TRUE)
sample(letters, size = 10)
?sample # default: replace = FALSE
sample(x, size = 100, replace = TRUE)
## x is a vector of combined values
x <- c(1,5,8)
x
sample(x, size = 6, replace = TRUE)


# random number generator drawing from specific distributions
?runif  # runif(n, min, max) 
?rpois  # rpois(n, lambda) 
?rnorm  # rnorm(n, mean, sd) 
?rbinom # rbinom(n, prob)	


# your turn: generate random numbers






# repeat 
?replicate # replicate(n, expression)
rnorm(10)
mean(rnorm(10))
replicate(10,rnorm(10))
replicate(10, mean(rnorm(100)))
hist(replicate(10, mean(rnorm(100))))

# your turn: generate random numbers, repeat, and plot







# set seed
hist(replicate(100, mean(rnorm(10))))
hist(replicate(100, mean(rnorm(10))))
hist(replicate(100, mean(rnorm(10))))

set.seed(10)
hist(replicate(100, mean(rnorm(10))))

set.seed(10)
hist(replicate(100, mean(rnorm(10))))


# defining sample size within a replication
## single random sample of normal distribution N(0,1) with n=10
x <- rnorm(10, mean=0, sd=1)
hist(x, breaks=10, col="grey", xlim=c(-4,4))
abline(v=0, col="red", lty=2, lwd=2)

## 24 sims of same distribution N(0,1) with n=10
set.seed(10)
x24 <- replicate(24, rnorm(10,0,1))
par(mfrow=c(3,8), mar=c(0,0,0,0))
x24Plot <- apply(x24,2,function(x){
               hist(x, col="grey", xlim=c(-5,5), ylim=c(0,7), breaks=c(-5:5),
                    main="", ylab="", xlab="", xaxt="n", yaxt="n")
               abline(v=mean(x), col="blue", lwd=2)
               abline(v=0, col="red", lty=2, lwd=2)
                })

## distribution of mu and sd from 24 sims N(0,1) with n=10
par(mfrow=c(1,2), mar=c(5,5,1,1))
hist(apply(x24, 2, mean), main="Mean",col="grey", xlim=c(-1,1))
abline(v=0, col="red", lty=2, lwd=2)
hist(apply(x24, 2, sd), main="SD",col="grey", xlim=c(0.6,1.4))
abline(v=1, col="red", lty=2, lwd=2)

## 24 sims of same distribution N(0,1) with n=1000
set.seed(10)
x24b <- replicate(24, rnorm(1000,0,1))
par(mfrow=c(3,8), mar=c(0,0,0,0))
x24bPlot <- apply(x24b,2,function(x){
               hist(x, col="grey", xlim=c(-5,5), ylim=c(0,500), breaks=c(-5:5),
                    main="", ylab="", xlab="", xaxt="n", yaxt="n")
               abline(v=mean(x), col="blue", lwd=2)
               abline(v=0, col="red", lty=2, lwd=2)
               })

## distribution of mu and sd from 24 sims N(0,1) with n=1000
par(mfrow=c(1,2), mar=c(5,5,1,1))
hist(apply(x24b, 2, mean), main="Mean",col="grey", xlim=c(-1,1))
abline(v=0, col="red", lty=2, lwd=2)
hist(apply(x24b, 2, sd), main="SD",col="grey", xlim=c(0.6,1.4))
abline(v=1, col="red", lty=2, lwd=2)

## distribution of mu and sd from 1000 sims N(0,1) with n=10
set.seed(10)
x1000 <- replicate(1000, rnorm(10,0,1))
par(mfrow=c(1,2), mar=c(5,5,1,1))
hist(apply(x1000, 2, mean), main="Mean",col="grey")
abline(v=0, col="red", lty=2, lwd=2)
hist(apply(x1000, 2, sd), main="SD",col="grey")
abline(v=1, col="red", lty=2, lwd=2)


#~~~~~~~~~ Functions

# writing a function
    ## function syntax
    ## AwesomeFunctionName <- function(argument1, argument2,…){
    ## do stuff here
    ## }

# your turn: write a function
## that draws a histogram of n draws of mean(rnorm(100))














    ## step 1: the action
    mean(rnorm(100))
    ## step 2: replicate the action 100 times
    replicate(100, mean(rnorm(100)))
    ## step 3: plot the outcome of those simulations
    hist(replicate(100, mean(rnorm(100))))
    ## step 4: replicate the action n time, with n defined outside the function
    nrep <- 100
    replicate(nrep, mean(rnorm(100)))
    ## step 5: wrap it in a function:
    histrnorm100 <- function (nrep){
      hist(replicate(n, mean(rnorm(100))))
    }
    ## step 6: check that the function works
    histrnorm100(9)

    
# your turn: modify your function
## to draw a histogram of n draws of mean(rnorm(n))







    
    

    ## step 4: replicate the action n time, with n defined outside the function
    nrep <- 100
    n <- 10
    replicate(nrep, mean(rnorm(n)))
    ## step 5: wrap it in a function:
    histrnorm_n <- function (nrep, n){
      hist(replicate(n, mean(rnorm(n))))
    }
    ## step 6: check that the function works
    histrnorm_n(9,3)
    
    


#~~~~~~~~~ Real (useful) simulation

# your turn: draw from the same distribution twice 
# and see if the sample differ from each other
# will they differ significantly in 5% of the nrep?
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    ## Figure out how to do a t.test in R
    ?t.test
    ## Generate two vectors of 50  N(0,1) 
    x1 <- rnorm(50,0,1)
    x2 <- rnorm(50,0,1)
    ## Compare them with a t test
    t.test(x1,x2)
    ## extract p value
    str(t.test(x1,x2))
    t.test(x1,x2)$p.value
    ## write function 
    simT <- function(n){
    x1 <- rnorm(n,0,1)
    x2 <- rnorm(n,0,1)
    t.test(x1, x2)$p.value 
    }
    ## test function
    simT(50)
    
    ## repeat function for n = 10 and for different nrep and plot
    par(mfrow=c(1,2))
    simTRep <- replicate(20, simT(10))
    hist(simTRep, col="grey", breaks=21)
    abline(v=0.05, lwd=2, lty=2, col="red")
    
    simTRep2 <- replicate(100, simT(10))
    hist(simTRep2, col="grey", breaks=21)
    abline(v=0.05, lwd=2, lty=2, col="red")
    
    ## repeat function for nrep = 1000 and various n
    par(mfrow=c(1,2))
    simTRep <- replicate(1000, simT(10))
    hist(simTRep, col="grey", breaks=21)
    abline(v=0.05, lwd=2, lty=2, col="red")
    
    simTRep2 <- replicate(1000, simT(100))
    hist(simTRep2, col="grey", breaks=21)
    abline(v=0.05, lwd=2, lty=2, col="red")


# draw from the same distribution twice 
# using a poisson with lambda = 3 rather than normal distribution
# and see how t.test performs

hist(rpois(100,3))















    ## write new function
    simTpoiss <- function(n){
      x1 <- rpois(n,3)
      x2 <- rpois(n,3)
      t.test(x1, x2)$p.value 
    }
    
    ## repeat function for n = 10 and for different nrep and plot
    par(mfrow=c(1,2))
    hist(replicate(20, simTpoiss(10)))
    abline(v=0.05, lwd=2, lty=2, col="red")
    hist(replicate(100, simTpoiss(10)))
    abline(v=0.05, lwd=2, lty=2, col="red")
    
    
    ## repeat function for nrep = 1000 and various n
    par(mfrow=c(1,2))
    hist(replicate(1000, simTpoiss(10)))
    abline(v=0.05, lwd=2, lty=2, col="red")
    hist(replicate(1000, simTpoiss(100)))
    abline(v=0.05, lwd=2, lty=2, col="red")
