arIPM <- function (rho, sigma0, int = 0, Fec = 0.4, mesh_size = 100, 
                   zmin = -6 * sigma0, zmax = 6 * sigma0, plot.it = FALSE) {
  sigma_eps <- sqrt((1 - rho^2) * sigma0^2)
  gr1 <- makeGrowthObj(Formula = sizeNext ~ -1 + size, coeff = c(rho, sigma_eps), 
                       sd = sigma_eps)
  sv1 <- makeSurvObj(Formula = surv ~ size, coeff = c(int, 1))
  # There seems to be a problem in which the specified coefficient is not reliably assigned
  sv1@fit$coefficients <- c(int, 1)
  Pmatrix <- makeIPMPmatrix(nBigMatrix = mesh_size, minSize = zmin, 
                            maxSize = zmax, growObj = gr1, survObj = sv1, 
                            correction = "constant")
  # diagnosticsPmatrix(Pmatrix, gr1, sv1)
  fec1 <- makeFecObj(Formula = list(fec ~ size), meanOffspringSize = 0, 
                     sdOffspringSize = sigma0, coeff = list(c(Fec,0)))
  Fmatrix <- makeIPMFmatrix(fec1,nBigMatrix = mesh_size, 
                            minSize = zmin, maxSize = zmax)
  IPM <- Pmatrix + Fmatrix
  lambda <- Re(eigen(IPM, only.values = TRUE)$value[1])
  R0 <- R0Calc(Pmatrix, Fmatrix)
  xx <- seq(zmin, zmax, length.out = mesh_size)
  del <- min(diff(xx))
  SSD <- popbio::stable.stage(IPM)
  if (plot.it) {
    plot(xx, SSD/del, type='l')
    lines(xx, dnorm(xx, 0, sigma0), col = "red")
  }
  mean_surv <- sum(SSD * 1/(1+exp(-xx)))
  R0_naive <- Fec/(1-mean_surv)
  mean_z <- sum(xx * SSD)
  sd_z <- sqrt(sum(SSD * (xx - mean_z)^2))
  return(list(
    lambda = lambda,
    R0 = R0,
    R0_naive = R0_naive,
    mean_surv = mean_surv,
    mean_z = mean_z,
    sd_z = sd_z,
    dists = data.frame(
      z = xx,
      newborns = dnorm(xx, 0, sigma0),
      adults = SSD/del
    )
  ))
}
