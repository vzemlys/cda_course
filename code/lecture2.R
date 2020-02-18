dt <- read.csv("~/Documents/Dėstymas/CDA/cda_course/data/time_series_19-covid-Confirmed.csv", check.names = FALSE)

library(tidyr)
ldt <- dt %>% gather(day, cases, X1.22.20:X2.17.20)



anhui <- dt[1,5:31]
anhui <- unlist(anhui)
all(diff(anhui)>0)

res <- rep(NA, nrow(dt))
for(i in 1:nrow(dt)) { 
	anhui <- dt[i, 5:31]
	anhui <- unlist(anhui)
	res[i] <- all(diff(anhui)>=0)
}

res <- apply(dt[,5:31], 1, function(anhui) {
	anhui <- unlist(anhui)
	all(diff(anhui)>=0)
})

test_increase <- function(row) {
	urow <- unlist(row) 
	all(diff(urow)>=0)
}

test_increase2 <- function(row) {
	urow <- unlist(row[5:31]) 
	all(diff(urow)>=0)
}

res <- apply(dt[,5:31], 1, test_increase)


res <- matrix(NA, nrow = nlevels(dt$Country.Region), ncol = length(5:31))
for(i in 5:31) {
	res[,i - 4] <- tapply(dt[, i], dt$Country.Region, sum)
}

res <- apply(dt[, 5:31], 2, function(col) {tapply(col, dt$Country.Region, sum)})