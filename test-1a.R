# Premier fichier
library(rlang)
library(purrr)
library(lobstr)

x<-NaN
v <- c(1, 12, 66, 7, 43)
tracemem(v)
u <- v
u[5] <-  8

l <-  v >10 

tracemem(l)

l[5] <- 5

matrix(1:6, nrow = 2, ncol = 3)


l <- list(1, 'e') 
ref(l)
k <- l
ref(k)
k[[2]] <- 8 
ref(k)


add_factory <- function (N) {
  function(x) x + N
}

x<-6
bonjour <- function (N) {
  x <- x+1
}
bonjour("30")
x
N<-3
increment_me <- function (x) {
  var_name <- enexpr(x)
  eval(expr(!! var_name <<- x +1)) # <<- environment global
}

increment_me(N)
N

str(mtcars)


data(mtcars)
tracemem(mtcars)

mtcars[1][1]

