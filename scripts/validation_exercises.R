# Load libraries
library(assertr)
library(dplyr)
library(readr)

# Load example data
df <- read_csv("../data/example_data.csv")

# Exercise 1: Verify no missing IDs
df %>%
  assert(not_na, id)

# Exercise 2: Age should be between 0 and 120
df %>%
  assert(within_bounds(0, 120), age)

# Exercise 3: Income should be non-negative
df %>%
  assert(within_bounds(0, Inf), income)

# Exercise 4: Gender should be either 'M' or 'F'
is_valid_gender <- function(x) x %in% c("M", "F")
df %>%
  assert(is_valid_gender, gender)
