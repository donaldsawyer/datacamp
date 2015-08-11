#Exercise1
library("data.table")

# Create your first data.table 
my_first_data_table <- data.table(x=c("a","b","c","d","e"), y = c(1,2,3,4,5))

# Create a data.table using recycling
DT <- data.table(a=c(1:2), b=c("A","B","C","D"))

# Print the third row to the console
DT[3,]

# Print the second and third row to the console, but do not use any comma at all
DT[2:3]

#Exercise 2
# The data.table DT is still loaded in your workspace

# Print the penultimate row of DT using `.N`
DT[.N-1]

# Print the column names of DT, and number of rows and number of columns
names(DT)
dim(DT)

# Select row 2 twice and row 3, returning a data.table with three rows where row 2 is a duplicate of row 1.
DT[c(2,2:3),]

# Section 2
#Exercise 1
#DT[,b] returns a vector

#Exercise 2
#DT[,D] returns a vector 5, DT[, .(D)] returns a data.table

#Exercise 3
# The data.table DT is still loaded in your workspace

# Subset rows 1 and 3, and columns B and C
DT[c(1,3), .(B, C)]

# Assign to ans the correct value
ans <- DT[,.(B, val=A*C)]

# Fill in the blank
answ <- DT[, .(B, val = as.integer(c(6,7,8,9,10,1,2,3,4,5)) )]

# SECTION 3
#Exercise 1
iris
# iris is already loaded in your workspace
library("data.table")

# iris as data.table
DT <- data.table(iris)

# mean `Sepal.Length`
DT[, .( mean(Sepal.Length)), by = .(Species)]

# Group by the first letter
DT[, .( mean(Sepal.Length)), by = .(substring(Species,1,1))]

#Exercise 2
library("data.table")
# The data.table DT is still loaded in your workspace

# Group the specimens by Sepal area (to the nearest 10 cm2) and count how many occur in each group.
DT[,.N, by=10*round(Sepal.Length*Sepal.Width/10)]

# Now name the output columns `Area` and `Count`
DT[,.(Count=.N), by=.(Area=10*round(Sepal.Length*Sepal.Width/10))]  

#Exercise 3 (THIS MADE NO SENSE)
library("data.table")

# The data.table DT
set.seed(1L)
DT <- data.table(A=rep(letters[2:1], each=4L), B=rep(1:4, each=2L), C=sample(8))

# DT2
DT2 <- DT[, .(C=cumsum(C)), by=.(A,B)]

# Now the last two values per grouping in A from C in DT2 while you group by A
DT2[, .(C=tail(C,2)), by=A] 


