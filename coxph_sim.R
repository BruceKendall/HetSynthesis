library(survival)
library(purrr)
set.seed(8374)
##############################################
N <- 1000
# Pop size
#
# as N gets large, the sparse matrix fitting routine fails - I guess it's 
#       just too sparse. With tweaking it might be made to work, but it
#       doesn't seem worth it.
#
x1 <- rnorm(N, mean=0, sd=1)
x2 <- rnorm(N, mean=0, sd=1) 
beta_1 <- 1
beta_2 <- -1
haz <- exp(beta_1 * x1 + beta_2 * x2)
time <- rexp(N, rate=haz)
cens_time <- runif(N, 20, 50)
event <- as.numeric(time <= cens_time)
time <- pmin(time, cens_time)
ID <- as.character(1:N)
#
df <- data.frame(ID, x1, x2, time,event)
rep.12 <- coxph(Surv(time,event) ~ x1 + x2, data=df)
rep.1 <- coxph(Surv(time,event) ~ x1, data=df)
rep.f <- coxph(Surv(time,event) ~ x1 + frailty.gamma(ID, eps=1e-10, method="em", sparse=TRUE),
             outer.max=50, iter.max=200,
             data=df)
 aft.12 <- survreg(Surv(time,event) ~ x1 + x2, data=df)
 aft.1 <- survreg(Surv(time,event) ~ x1, data=df)
############################################################
# as function

repetition <- function(i,N){
        N <- 2000
        x1 <- rnorm(N, mean=0, sd=1)
        x2 <- rnorm(N, mean=0, sd=1) 
        beta_1 <- 1
        beta_2 <- -1
        haz <- exp(beta_1 * x1 + beta_2 * x2)
        time <- rexp(N, rate=haz)
        cens_time <- runif(N, 20, 50)
        event <- as.numeric(time <= cens_time)
        time <- pmin(time, cens_time)
        ID <- as.character(1:N)
        #
        df <- data.frame(ID, x1, x2, time,event)
        rep.12 <- coxph(Surv(time,event) ~ x1 + x2, data=df)
        rep.1 <- coxph(Surv(time,event) ~ x1, data=df)
        rep.f <- coxph(Surv(time,event) ~ x1 + frailty.gamma(ID, eps=1e-10, method="em", sparse=TRUE),
                     outer.max=50, iter.max=200, data=df)
        aft.12 <- survreg(Surv(time,event) ~ x1 + x2, data=df)
        aft.1 <- survreg(Surv(time,event) ~ x1, data=df)
        data.frame(i = i, beta12 = rep.12$coefficients[[1]], beta1 = rep.1$coefficients[[1]], betaf = rep.f$coefficients, 
            aft.b12 =aft.12$coefficients[[2]], aft.b1=aft.1$coefficients[[2]])
        }
results <- map_dfr(seq_len(200), repetition)
#
mean.beta12 <- mean(results$beta12)
sd.beta12 <- sd(results$beta12)
mean.beta1 <- mean(results$beta1)
sd.beta1 <- sd(results$beta1)
mean.betaf <- mean(results$betaf)
sd.betaf <- sd(results$betaf)
mean.aft.b12 <- mean(results$aft.b12)
sd.aft.b12 <- sd(results$aft.b12)
mean.aft.b1 <- mean(results$aft.b1)
sd.aft.b1 <- sd(results$aft.b1)

means <- c(mean.beta12, mean.beta1, mean.betaf, mean.aft.b12, mean.aft.b1)
sds <- c(sd.beta12, sd.beta1, sd.betaf, sd.aft.b12, sd.aft.b1)
sum.df <- data.frame(Mean = means,SD = sds)
rownames(sum.df) <- c("Beta.12", "Beta.1", "Beta.f", "AFT-Beta.12", "AFT-Beta.1")


#with(results, cor(beta1,betaf))
#with(results, plot(beta1, betaf))

