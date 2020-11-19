library(lobstr)
library(data.table)
library(microbenchmark)

data(mtcars)
ref(mtcars)
mtcars$cyl[1] <- 12
ref(mtcars)

df <-  as.data.table(mtcars)
ref(df)
df[1, cyl := 12]
ref(df)

# deuxième exemple
data(mtcars)

X <- mtcars
Y <- as.data.table(mtcars)

foo_trad <- function() {
  for(i in 1:100) X[1,1] <- i
}

foo_data.table <- function() {
  for(i in 1:100)  Y[1, mpg := i]
}


microbenchmark(foo_trad(),foo_data.table())


## troisième exemple

df <- mtcars
for(i in 1:3000)  df <- rbind(df, mtcars)

X <- df
Y <- as.data.table(df)

foo_trad <- function() {
  for(i in 1:100) X[1,1] <- i
}

foo_data.table <- function() {
  for(i in 1:100)  Y[1, mpg := i]
}

microbenchmark(foo_trad(),foo_data.table())

