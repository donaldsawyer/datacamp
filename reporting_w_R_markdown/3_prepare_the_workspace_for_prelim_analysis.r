# Load the 'nasaweather' package
library(nasaweather)

# Load the 'dplyr' package
library(dplyr)

# Load the 'ggvis' data set
library(ggvis)


#Exercise 4
# The 'nasaweather' and 'dplyr' packages are available in the workspace

# Set the 'year' variable to 1995
year <- 1995

means <- atmos %>% 
    filter(year == year) %>%
    group_by(long, lat) %>%
    summarize(temp = mean(temp, na.rm = TRUE), 
              pressure = mean(pressure, na.rm = TRUE),
              ozone = mean(ozone, na.rm = TRUE),
              cloudlow = mean(cloudlow, na.rm = TRUE),
              cloudmid = mean(cloudmid, na.rm = TRUE),
              cloudhigh = mean(cloudhigh, na.rm = TRUE)) %>%
    ungroup()

# Inspect the means variable
means

#Exercise 5
# The 'nasaweather', dplyr' and 'ggvis' packages are loaded in the workspace.

# Code for the previous exercise - do not change this
means <- atmos %>% 
    filter(year == 1995) %>%
    group_by(long, lat) %>%
    summarize(temp = mean(temp, na.rm = TRUE), 
              pressure = mean(pressure, na.rm = TRUE),
              ozone = mean(ozone, na.rm = TRUE),
              cloudlow = mean(cloudlow, na.rm = TRUE),
              cloudmid = mean(cloudmid, na.rm = TRUE),
              cloudhigh = mean(cloudhigh, na.rm = TRUE)) %>%
    ungroup()

# Change the code to plot the 'temp' variable vs the 'ozone' variable
means %>% 
    ggvis(x = ~temp, y = ~ozone) %>%
    layer_points()

#Exercise 6
# The 'nasaweather' and dplyr' packages are already at your disposal
means <- atmos %>% 
    filter(year == 1995) %>%
    group_by(long, lat) %>%
    summarize(temp = mean(temp, na.rm = TRUE), 
              pressure = mean(pressure, na.rm = TRUE),
              ozone = mean(ozone, na.rm = TRUE),
              cloudlow = mean(cloudlow, na.rm = TRUE),
              cloudmid = mean(cloudmid, na.rm = TRUE),
              cloudhigh = mean(cloudhigh, na.rm = TRUE)) %>%
    ungroup()

# Change the model: base prediction only on 'temp'
mod <- lm(ozone ~ temp, data = means)

# Generate a model summary and interpret the results
summary(mod)

