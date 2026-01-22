# R dataframe usable for simple survival analyses

# Generate numbers of individuals at each time
# Parameters to be set are mu_x (mortality), NO_x (initial size of each group), and Time
require(rlist)
#
mu_1 <- 0.15;
mu_2 <- 0.25 * mu_1

N0_1 <- 1000;
N0_2 <- 1000;

Time <- 0:50;

N_1 <- N0_1 * exp(- mu_1 * Time)
N_2 <- N0_2 * exp(- mu_2 * Time)
N <- N_1 + N_2;
#
S_1 <- N_1/N0_1
S_2 <- N_2/N0_2
S <- N/(N0_1 + N0_2)

#plot(Time,S, type="p", pch=15,col="black",font.axis=2,font.lab=2)
#points(Time,S_1, col = "orange", pch=16)
#points(Time,S_2, col = "blue", pch=17)
#
#
#par(font=2)
#legend(39,0.98, legend= c("Type A", "Type B", "Total"),lty=3:1, col=c("orange","blue", "black"), pch=c(16,17,15),bty="n")
#
###############################################################################
#   Now generate a dataframe with the appropriate numbers of deaths at each time
#
    n <- c(N_1, N_2)
    Type <-c(rep("A", length(N_1)), rep("B",length(N_2)))
    time <- c(0:50,0:50)
    deaths1 <- N_1[1:50] - N_1[-1][1:50]
    deaths2 <- N_2[1:50] - N_2[-1][1:50]
    deaths <- c(c(NA, deaths1), c(NA,deaths2))
    df <- data.frame(time, n, deaths, Type)
    
    times1 <- rep(1:50, deaths1)
    times2 <- rep(1:50, deaths2)

    pad.end <- function(x,n, z){
        len.diff <- n - length(x)
        c(x, rep(len.diff,z))
    }   
    
    # todo - rewrite this as a function
    len.diff1 <- N_1[1] - length(times1)
    pad1 <-   c(times1, rep(max(time), len.diff1))
    len.diff2 <- N_2[1] - length(times2)
    pad2 <-   c(times2, rep(max(time), len.diff2))
    event1 <- c(rep(1, length(times1)), rep(0, len.diff1))
    event2 <- c(rep(1, length(times2)), rep(0, len.diff2))
    type <- as.factor(c(rep("A", N_1[1]), rep("B", N_2[1])))
    surv.df <- data.frame(type, time = c(pad1, pad2), event = c(event1, event2))
    
###############################################################################
#   Now do Kaplan-Meier fits and plot themO    
        
#       clever way to really get a common legend including "pooled"
#       but it does not yet work

        
        fit0<- survfit(Surv(time,  event) ~ 1, data = surv.df)
        fit1 <- survfit(Surv(time,  event) ~ type, data = surv.df)
        
#       hack to add "pooled" to legend. Sadly, not working yet
#        list.append(fit0, "strata")
#       fit0$strata <- 50
#        names(fit0$strata) <- "type=pooled"
        
        gp.f0 <- ggsurvfit(fit0, linetype_aes=TRUE, color="black") + scale_ggsurvfit() + add_confidence_interval(fill="grey") +  theme(legend.position="top")
        gp.f1 <- ggsurvfit(fit1, linetype_aes=TRUE) + scale_ggsurvfit() + add_confidence_interval() +  theme(legend.position="top")


