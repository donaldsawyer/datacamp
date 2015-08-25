#Exercise 1
library("data.table")
# DT
set.seed(1L)
DT <- data.table(A=rep(letters[2:1], each=4L), B=rep(1:4, each=2L), C=sample(8)) 
DT[,.(C=cumsum(C)), by=.(A,B)][,.(tail(C,2)), by=A]

#Exercise 2
library("data.table")
#i <- data.table(iris)
#i[, .(Sepal.Length=mean(Sepal.Length), 
#      Sepal.Width=mean(Sepal.Width), 
#      Petal.Length=mean(Petal.Length), 
#      Petal.Width=mean(Petal.Width)), by=Species][order(Species, decreasing=TRUE)]

#data.table(iris)[, .(Sepal.Length=mean(Sepal.Length), Sepal.Width=mean(Sepal.Width), Petal.Length=mean(Petal.Length), Petal.Width=mean(Petal.Width)), by=Species][order(Species, decreasing=TRUE)]
DT[, .( Sepal.Length=median(Sepal.Length), Sepal.Width=median(Sepal.Width), Petal.Length=median(Petal.Length),Petal.Width=median(Petal.Width)), by=Species][order(-Species)]

#Exercise 3
#.SD is a subset of all the columns except in the "by" columns
# The data.table DT is loaded in your workspace
DT
# Mean of columns
DT[, lapply(.SD, mean), by=x]
# Median of columns
DT[, lapply(.SD, median), by=x]

#Exercise 4 - using .SDcols to specify subset of columns
?data.table
paste0("H",1:2)
# The data.table DT is loaded in your workspace
DT
# Calculate the sum of the Q columns
DT[,lapply(.SD, sum), .SDcols=2:4]
# Calculate the sum of columns H1 and H2 
DT[,lapply(.SD, sum), .SDcols=paste0("H",1:2)]
# Select all but the first row of groups 1 and 2, returning only the grp column and the Q columns. 
DT[,.SD[-1], by=grp, .SDcols=paste0("Q",1:3)]

#Exercise 5
# The data.table DT and the variables desired_result_1 and desired_result_2 are loaded in your workspace
# Sum of all columns and the number of rows
DT[, c(lapply(.SD, sum), N=.N), by=x, .SDcols=1:3]
# Cumulative sum of column `x` and `y` while grouping by `x` and `z > 8`
DT[, lapply(.SD, cumsum),by=.(by1=x, by2=z>8), .SDcols=c("x", "y")]
# Chaining
DT[, lapply(.SD, cumsum),by=.(by1=x, by2=z>8), .SDcols=c("x", "y")][, lapply(.SD, max), by=by1, .SDcols=c("x","y")]

#Exercise 6
# The data.table DT is loaded in your workspace
library("data.table")
DT

# # Column `Total` by reference
DT[, Total := sum(B), by=A]

# Add 1 to column `B`
DT[c(2,4), B:=B+1L]

# Add a new column `Total2`
DT[c(2:4), Total2 := sum(B), by=A]

# Remove the `Total` column
DT[, Total := NULL]

# Select the third column using `[[`
DT[[3]]

#Exercise 7
DT <- data.table(A=c(1,1,1,2,2), B=1:5)

# Update `B`, add `C` and `D`
DT[, `:=` ( B = B+1,
            C = A + B,
            D = 2L )]

# Delete `myCols`
myCols = c("B","C")
DT[, (myCols) := NULL]

# Delete column 2 by number
DT[, 2 := NULL]

#Exercise 8 - using set
set.seed(1)
#dtold = DT
# Check the DT that is made available to you
DT

# For loop with set
for(i in 2:4) {
    set(DT, sample(1:10, 3), i, NA)
}
DT
# Change the column names to lowercase
setnames(DT, names(DT), tolower(names(DT)))

# Print the new DT to the console so we can check your answer
DT

#Exercise 9
DT <- data.table(a=letters[c(1,1,1,2,2)], b=1)

# Postfix "_2"
setnames(DT, names(DT), paste0(names(DT), "_2"))

# "a_2" to "A2"
setnames(DT, "a_2", "A2")

# Reversing order
setcolorder(DT, rev(names(DT)))



