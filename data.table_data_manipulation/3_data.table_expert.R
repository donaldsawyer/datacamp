#Exercise 1
library("data.table")

# iris as data.table
iris = as.data.table(iris)

# Species is "virginica"
iris[Species == "virginica"]

# Species is either "virginica" or "versicolor"
iris[Species %in% c("virginica", "versicolor")]


#Exercise 2
# The `iris` data.table is still loaded in your workspace

# Remove the Sepal. prefix... 
setnames(iris, gsub("^Sepal[.]", "", names(iris)))

# ...and remove the two `Petal` columns
iris[, grep("^Petal",names(iris)) := NULL]

#Exercise 3
# The data.table iris is already loaded in your workspace
iris

# Area is greater than 20 square centimeters
iris[Length*Width > 20]

# Add new boolean column
iris[,IsLarge := (Length*Width > 20)]

# Now select rows again where the area is greater than 20 square centimeters
iris[IsLarge==TRUE]

#Exercise 4
> DT
A B  C
1: b 2  6
2: a 4  7
3: b 1  8
4: c 7  9
5: a 5 10
6: b 3 11
7: c 6 12
> DT[B=="b"]
Empty data.table (0 rows) of 3 cols: A,B,C
> DT[A=="b"]
A B  C
1: b 2  6
2: b 1  8
3: b 3 11
> setkey(DT, A, B)
> DT["b"]
A B  C
1: b 1  8
2: b 2  6
3: b 3 11

#Exercise 5
# This is your data.table `DT`. The keys are set to `A` and `B`
DT <- data.table(A=letters[c(2,1,2,3,1,2,3)], B=c(5,4,1,9,8,8,6), C=6:12)
setkey(DT,A,B)

# Select the `b` group
DT["b"]

# `b` and `c` groups
DT[c("b", "c")]

# The first row of the `b` and `c` group
DT[c("b", "c"), mult="first"]

# `by=.EACHI` and `.SD` 
DT[c("b", "c"), .SD[c(1,.N)], by=.EACHI]

# Print out all the data in the two groups before you return the first and last row of each group again.  Use {} and .N 
DT[c("b", "c"), {print(.SD); .SD[c(1,.N)]}, by=.EACHI]

#Exercise 6
# The data.table DT is still loaded in your workspace
library("data.table")

# Key of `DT`
key(DT)

# Row where  `A=="b"` & `B==6`
DT[.("b", 6)]

# Return the prevailing row
DT[.("b", 6), roll=TRUE]

# Nearest one
DT[.("b", 6), roll="nearest"]

#eXERCISE 6
# The data.table DT is still loaded in your workspace


# Look at the sequence (-2):10 for the `b` group
DT[.("b", (-2):10)]

# Carry the prevailing values forwards
DT[.("b", (-2):10), roll=TRUE]

# Carry the first observation backwards
DT[.("b", (-2):10), rollends=TRUE]

# Roll for a distance of 2
DT[.("b", (-2):10), rollends=TRUE, roll=2]

#Exercise 7
