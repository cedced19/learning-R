library(purrr)
library(rlang)

X_1 = 3
X_2 = 4
X_3 = 5


my_sum1 <- function(prefix, min, max) {
  prefix <- enexpr(prefix)
  s <- 0
  for (i in min:max) {
    name = paste(prefix, "_", i, sep="")  # label0 est plus lisible
    s <- s + get(name)
  }
  s
}

my_sum1(X, min = 1, max = 3)


my_sum2 <- function(prefix, min, max) {
  prefix <- enexpr(prefix)
  v = map_dbl(min:max, function (i) {
    get(paste0(prefix, "_", i))
  })
  sum(v)
}

my_sum2(X, min = 1, max = 3)

genMyFuns <- function(thresholds) {
  ll <- length(thresholds)
  print("Generating functions:")
  for(i in 1:ll) {
    fName <- paste("myFun.", i, sep="")
    print(fName)
    assign(fName, eval(
      substitute(
        function(vec) {
          numElements <- length(which(vec > tt));
          numElements;
        }, 
        list(tt=thresholds[i])
      )
    ),
    envir=parent.frame()
    )
  }
}
genMyFuns(c(7, 9, 10))


args <- alist(x=,y=)
exps <- expression(z <- x^2 + y^2, z <- sqrt(z), return(z))
body <- as.call(c(as.name("{"), exps))
f <- as.function(x = c(args,body), envir = parent.frame())
f(x=1,y=1)

