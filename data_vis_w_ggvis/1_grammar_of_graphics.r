#install.packages("ggvis")
require(ggvis)
#Exercise 1
# ggvis is already installed for you; now load it and start playing around
library(ggvis)

# change the code below to plot the disp variable of mtcars on the x axis
mtcars %>% ggvis(~disp, ~mpg) %>% layer_points()

#Exercise 2
# The ggvis packages is loaded into the workspace already

# Change the code below to make a graph with red points
mtcars %>% ggvis(~wt, ~mpg, fill := "red") %>% layer_points()

# Change the code below draw smooths instead of points
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()

# Change the code below to make a graph containing both points and a smoothed summary line
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()

#Exercise 3
# Make a scatterplot of the pressure dataset
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points()

# Adapt the code you wrote for the first challenge: show bars instead of points
pressure %>% ggvis(~temperature, ~pressure) %>% layer_bars()

# Adapt the code you wrote for the first challenge: show lines instead of points
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()

# Adapt the code you wrote for the first challenge: map the fill property to the temperature variable
pressure %>% ggvis(~temperature, ~pressure, fill=~temperature) %>% layer_points()

# Extend the code you wrote for the previous challenge: map the size property to the pressure variable
pressure %>% ggvis(~temperature, ~pressure, fill=~temperature, size=~pressure) %>% layer_points()

#Exercise 4
iris %>% ggvis(x = ~Sepal.Width,
               y = ~Sepal.Length,
               fill = ~Species,
               size = ~Petal.Width) %>% layer_points()

# Rewrite the code with the pipe operator     
faithful %>% ggvis(~waiting, ~eruptions) %>% layer_points()

# Modify this graph to map the size property to the pressure variable
pressure %>% ggvis(~temperature, ~pressure, size=~pressure) %>% layer_points()

# Modify this graph by setting the size property
pressure %>% ggvis(~temperature, ~pressure, size:=100) %>% layer_points()

# Fix this code to set the fill property to red
pressure %>% ggvis(~temperature, ~pressure, fill := "red") %>% layer_points()

#Exercise 5
