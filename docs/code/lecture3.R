##Read in the data
pe <- read.table('https://raw.githubusercontent.com/matloff/polyreg/master/data/prgeng.txt',
   header=TRUE)
   

##Using ifelse can be complicated. 

pe0 <- pe

pe0$educ <- ifelse(pe0$age < 40, 20, pe0$educ)

pe0educ$[pe0$age < 40, "educ"] <- 20


##Change part of the data using the ifelse
pe1 <- pe

pe1[, "educ"] <- ifelse(pe1$age < 40, 20, 40)


##Do the same without the ifelse
pe2 <- pe

pe2[pe2$age < 40, "educ"] <- 20

pe2[pe2$age >=40, "educ"] <- 40

##Compare the results

##Using comparison ==
pe1$educ == pe2$educ

all(pe1$educ == pe2$educ)

## Using the difference. Note the abs!
sum(abs(pe1$educ-pe2$educ))

##The previous way is safer for numeric data

##List elements can be anything
ll <- list(abrakadabra = 1, b = 1:2, c = "Hello", d = list( a = 1, b = 2))

##Using $ allows to not type the full name of the ellement

ll$a

ll[["abrakadabra"]]

##Time series

## Load US cpi data
library(midasr)
data(UScpiqs)
UScpiqs

##Convert it to time series
cpi <- ts(UScpiqs[,2], start=1960, frequency = 4)
cpi

#See nice x axis ticks
plot(cpi)

#Compare with non-time series objects
plot(UScpiqs[,2])
plot(UScpiqs[,2])
plot(UScpiqs[,1],UScpiqs[,2])

##Select time series elements directly

cpi[1:5]

##Use window function to refer to time dimension
window(cpi, start=c(1980,1), end=c(1980,4))
sum(window(cpi, start=c(1980,1), end=c(1980,4)))

##Frequency and time
frequency(cpi)
time(cpi)

## Various frequencies can be used. Most common are 4 and 12 for quarterly and monthly time series
ts(1:10, frequency=3)

time(ts(1:10, frequency=3))

