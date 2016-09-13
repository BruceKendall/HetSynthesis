Sinf <- 10 # Asymptotic size w/out growth variation
S0 <- 0 # Mean initial size
g0 <- 1 # Mean growth increment at S0
gsigma <- 0.5 # SD around mean growth curve

# Set up parameters for mean growth function
slope <- (Sinf - (S0 + g0)) / (Sinf - S0)
intercept <- Sinf - slope * Sinf
growth_pars <- list(
  intercept = intercept,
  slope = slope,
  sigma = gsigma
)

# Function to generate "mean" (deterministic) growth curve
grow_det <- function(max_age = 50, Sinit = S0, pars = growth_pars) {
  simulation <- data.frame(age = 0:max_age, size = Sinit)
  for (i in 1:max_age) {
    simulation$size[i+1] <- pars$intercept + pars$slope * simulation$size[i]
  }
  return(simulation)
}

# Function to generate stochastic growth curves
grow_sim <- function(nsim = 100, max_age = 50, Sinit = S0, pars = growth_pars) {
  simulation <- matrix(Sinit, max_age + 1, nsim)
  for (i in 1:max_age) {
    simulation[i+1,] <- pars$intercept + pars$slope * simulation[i,] + 
      rnorm(nsim, 0, pars$sigma)
  }
  return(cbind(0:max_age, simulation))
}

# Run a handful of simulations for illustration
stoch_size <- grow_sim(5)
det_size <- grow_det(50)

# Plot the size trajectories
matplot(0:50,stoch_size[,-1], type = 'l', xlab="age", ylab="size")
lines(det_size)

# Calculate the residual size-at-age. Note that here I am using the deterministic model
#   rather than the sample mean because of small sample size
size_resid <- stoch_size[,-1] - det_size[,-1]
matplot(0:50,size_resid, type = 'l', xlab="age", ylab="residual size")

# Calculate the 1st-order autocorrelation of the residual series
apply(size_resid, 2, function(x) acf(x, lag.max = 1, plot = FALSE)$acf[2])
