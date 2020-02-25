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
