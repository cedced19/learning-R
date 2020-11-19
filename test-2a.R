library(lobstr)

data(mtcars)
ref(mtcars)
attributes(mtcars)


df <- mtcars
ref(df)
df$cyl[1] <-12