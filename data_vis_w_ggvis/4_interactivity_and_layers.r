#Exercise 1
# Run this code and inspect the output. Follow the link in the instructions for the interactive version
faithful %>% 
    ggvis(~waiting, ~eruptions, fillOpacity := 0.5, 
          shape := input_select(label = "Choose shape:", 
                                choices = c("circle", "square", "cross", "diamond", 
                                            "triangle-up", "triangle-down"))) %>% 
    layer_points()

# Copy the first code chunk and alter the code to make the fill property interactive using a select box
faithful %>% 
    ggvis(~waiting, ~eruptions, fillOpacity := 0.5, 
          shape := input_select(label = "Choose shape:", 
                                choices = c("circle", "square", "cross", "diamond", 
                                            "triangle-up", "triangle-down")),
          fill := input_select(label = "Choose color:",
                               choices  = c("black", "red", "blue", "green"))) %>% 
    layer_points()

# Add radio buttons to control the fill of the plot
mtcars %>% 
    ggvis(~mpg, ~wt, fill := input_radiobuttons(label = "Choose color:",
                                                choice = c("black", "red", "blue", "green"))) %>% 
    layer_points()

#Exercise 2
# Change the radiobuttons widget to a text widget 
mtcars %>% 
    ggvis(~mpg, ~wt, 
          fill := input_text(label = "Choose color:", value="black")) %>% 
    layer_points()

# Map the fill property to a select box that returns variable names
mtcars %>% 
    ggvis(~mpg, ~wt, fill=input_select(label="Choose fill variable:", 
                                       choices = names(mtcars),
                                       map=as.name)) %>% 
    layer_points()

#Exercise 3
# Map the bindwidth to a numeric field ("Choose a binwidth:")
mtcars %>% 
    ggvis(~mpg, width=input_numeric(label="Choose a binwidth:",
                                    value=1)) %>% 
    layer_histograms(width = 2)

# Map the binwidth to a slider bar ("Choose a binwidth:") with the correct specifications
mtcars %>% 
    ggvis(~mpg, width=input_slider(label="Choose a binwidth:",
                                   min=1, max=20)) %>% 
    layer_histograms()

#Exercise 4
# Add a layer of points to the graph below.
pressure %>% 
    ggvis(~temperature, ~pressure, stroke := "skyblue") %>% 
    layer_lines() %>% layer_points()

# Copy and adapt the solution to the first instruction below so that only the lines layer uses a skyblue stroke.
pressure %>% 
    ggvis(~temperature, ~pressure) %>% 
    layer_lines(stroke := "skyblue") %>% layer_points()

# Rewrite the code below so that only the points layer uses the shape property.
pressure %>% 
    ggvis(~temperature, ~pressure) %>% 
    layer_lines(stroke := "skyblue") %>% 
    layer_points(shape := "triangle-up")

# Refactor the code for the graph below to make it as concise as possible
pressure %>% 
    ggvis(~temperature, ~pressure, strokeOpacity := 0.5, 
          stroke:="skyblue", strokeWidth:=5) %>% 
    layer_lines() %>% 
    layer_points(fill = ~temperature, shape := "triangle-up", 
                 size := 300)

#Exercise 5
# Create a graph containing a scatterplot, a linear model and a smooth line.
pressure %>% ggvis(~temperature, ~pressure) %>%
    layer_points() %>%
    layer_paths() %>%
    layer_model_predictions(model="lm", stroke:="navy") %>%
    layer_lines(opacity:=0.5) %>%
    layer_smooths(stroke:="skyblue")

#Exercise 6
# add the title of the x axis: "Time since previous eruption (m)"
faithful %>% 
    ggvis(~waiting, ~eruptions) %>% 
    layer_points() %>% 
    add_axis("y", title = "Duration of eruption (m)") %>%
    add_axis("x", title = "Time since previous eruption (m)")

# Add to the code to place a labelled tick mark at 50, 60, 70, 80, 90 on the x axis.
faithful %>% 
    ggvis(~waiting, ~eruptions) %>% 
    layer_points() %>% 
    add_axis("y", title = "Duration of eruption (m)", 
             values = c(2, 3, 4, 5), subdivide = 9) %>% 
    add_axis("x", title = "Time since previous eruption (m)",
             values = c(50,60,70,80,90), subdivide=9)

# Change the code below to change the axes' locations
faithful %>% 
    ggvis(~waiting, ~eruptions) %>% 
    layer_points() %>%
    add_axis("y", orient="right") %>%
    add_axis("x", orient="top")

#Exercise 7
# Add a legend to the plot below: use the correct title and orientation
faithful %>% 
    ggvis(~waiting, ~eruptions, opacity := 0.6, 
          fill = ~factor(round(eruptions))) %>% 
    layer_points() %>%
    add_legend("fill", title="~ duration (m)", orient="left")

# Use add_legend() to combine the legends in the plot below. Adjust its properties as instructed.
faithful %>% 
    ggvis(~waiting, ~eruptions, opacity := 0.6, 
          fill = ~factor(round(eruptions)), 
          shape = ~factor(round(eruptions)),
          size = ~round(eruptions))  %>%
    add_legend(c("fill", "shape", "size"), title="~ duration (m)",
               values=c(2,3,4,5)) %>%
    layer_points()

#Exercise 8
# Add to the code below to make the stroke color range from "darkred" to "orange".
mtcars %>% 
    ggvis(~wt, ~mpg, fill = ~disp, stroke = ~disp, strokeWidth := 2) %>%
    layer_points() %>%
    scale_numeric("fill", range = c("red", "yellow")) %>%
    scale_numeric("stroke", range=c("darkred", "orange"))

# Change the graph below to make the fill colors range from green to beige.
mtcars %>% ggvis(~wt, ~mpg, fill = ~hp) %>%
    layer_points() %>%
    scale_numeric("fill", range=c("green", "beige"))

# Create a scale that will map `factor(cyl)` to a new range of colors: purple, blue, and green. 
mtcars %>% ggvis(~wt, ~mpg, fill = ~factor(cyl)) %>%
    layer_points() %>%
    scale_nominal("fill", range=c("purple", "blue", "green"))

#Exercise 9
# Add a scale that limits the range of opacity from 0.2 to 1. 
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~factor(cyl), opacity = ~hp) %>%
    layer_points() %>% 
    scale_numeric("opacity", range=c(0.2, 1))

# Add a second scale that will expand the x axis to cover data values from 0 to 6.
mtcars %>% ggvis(~wt, ~mpg, fill = ~disp) %>%
    layer_points() %>%
    scale_numeric("y", domain = c(0, NA)) %>%
    scale_numeric("x", domain = c(0,6))

#Exercise 10
# Set the fill value to the color variable instead of mapping it, and see what happens
mtcars$color <- c("red", "teal", "#cccccc", "tan")
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill := ~color) %>% layer_points()

