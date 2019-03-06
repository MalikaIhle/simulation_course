##############################
## code use in presentation ##
##############################


# sample 
x <- 1:10
x
sample(x)
sample(x, replace = TRUE)
sample(letters, size = 10)
?sample # default: replace = FALSE
sample(x, size = 100, replace = TRUE)

# random number generator drawing from specific distributions
?runif
?rpois
?rnorm
?rbinom

# your turn: generate random numbers





# repeat 
?replicate
rnorm(10)
mean(rnorm(10))
replicate(10,rnorm(10))
replicate(10, mean(rnorm(100)))

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
