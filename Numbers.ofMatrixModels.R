library(Rcompadre)
#
compadre <- cdb_fetch("compadre")
comp.yr <- compadre[,22]
comp.byYear <- table(comp.yr$YearPublication)
comp.byYear <- as.data.frame(comp.byYear)
names(comp.byYear) <- c("Year", "Count")
comp.byYear <- comp.byYear[1:52,]
comp.byYear$Total <- cumsum(comp.byYear$Count)
#
plot(comp.byYear$Year, comp.byYear$Count, xlab="Year", ylab="count")
plot(comp.byYear$Year, comp.byYear$Total, xlab="Year", ylab="Cumulative total", main = "Compadre")
#
comadre <- cdb_fetch("compadre")
com.yr <- comadre[,22]
com.byYear <- table(com.yr$YearPublication)
com.byYear <- as.data.frame(com.byYear)
names(com.byYear) <- c("Year", "Count")
com.byYear <- com.byYear[1:52,]
com.byYear$Total <- cumsum(com.byYear$Count)
#
plot(com.byYear$Year, com.byYear$Count, xlab="Year", ylab="count")
plot(com.byYear$Year, com.byYear$Total, xlab="Year", ylab="Cumulative total", main = "Comadre")
