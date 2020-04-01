## Read in the data
dt <- read.csv("data/time_series_19-covid-Confirmed.csv")

## Are the time series in the first row increasing or not?
anhui <- dt[1,5:31]
anhui <- unlist(anhui)
all(diff(anhui)>0)

## Are all of the time series increasing?
res <- rep(NA, nrow(dt))
for(i in 1:nrow(dt)) { 
	anhui <- dt[i, 5:31]
	anhui <- unlist(anhui)
	res[i] <- all(diff(anhui)>=0)
}

## Use apply instead of apply
res <- apply(dt[,5:31], 1, function(anhui) {
	anhui <- unlist(anhui)
	all(diff(anhui)>=0)
})

## Example with the function
test_increase <- function(row) {
	urow <- unlist(row) 
	all(diff(urow)>=0)
}

res <- apply(dt[,5:31], 1, test_increase)

## Let us move the columns inside the function

test_increase2 <- function(row) {
	urow <- unlist(row[5:31]) 
	all(diff(urow)>=0)
}

## Why it does not work?
res <- apply(dt, 1, test_increase)

## Aggregate the time series by Country

## Using loops
res <- matrix(NA, nrow = nlevels(dt$Country.Region), ncol = length(5:31))
for(i in 5:31) {
	res[,i - 4] <- tapply(dt[, i], dt$Country.Region, sum)
}

## Using apply. Note the preserved column names and meaningful rownames
res <- apply(dt[, 5:31], 2, function(col) {tapply(col, dt$Country.Region, sum)})
