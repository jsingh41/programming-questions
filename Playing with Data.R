# We introduce a few commands related to fetching and playing with data

# First, remove all variables in the R workspace

rm(list = ls())
library(data.table)
library(datasets)

# Let's start:
numeric_vector <- c(3.14, 2.718, 1.618)                     # numeric
numeric_other_vector <- c("numeric", length = 4)            # numeric - alternate
logical_vector <- c(TRUE, FALSE, TRUE)                      # logical
logical_short_vector <- c(T, F, T)                          # logical - alternate
character_vector <- c("a", "b", "c", "d", "e","f")          # character
integer_vector <- 1:24                                      # integer
sequence_vector <- seq(1,10,by = 0.5)
rep_vector <- rep(c(0,1,2),times = 5)
complex_vector <- c(11+10i, 1+42i)                          # complex
mixed_class_object_vector <- c(0.55,"a")                    # This would be a character

#Check the class of this vector
class(mixed_class_object_vector)                            # Get the class of the above vector
mixed_class_another_vector <- c(TRUE, 45)                   # Can you guess what this would be?
class(mixed_class_another_vector)                           # Logical is converted to Boolean, FALSE - 0, TRUE - 1
as.numeric(logical_vector)



# Matrices
first_mat <- matrix(nrow = 3,ncol = 3)
first_mat
dim(first_mat)
second_mat <- matrix(25:30,nrow =3, ncol = 2)
second_mat
third_mat <- integer_vector
dim(third_mat) <- c(12,2)                                             # Note that dim is a function
third_mat
fourth_mat <- rbind(third_mat,second_mat)
fourth_mat


# Lists
first_list <- list(14,"Happy",2+7i, FALSE)


# Data Frames
df_first <- data.frame(Order_No = 1:5,City = c("New York","London","Chicago","Toronto","Boston"),Country = c("US","UK","US","CA","US"))
df_first
nrow(df_first)
ncol(df_first)
df_second <- data.frame(first_mat,second_mat)

# Factors
first_factor <- factor(c("hot","cold","hot","cold","neutral","cold","neutral"))
first_factor
# unclass(first_factor)

# Names
names(numeric_vector)                                          # Note that names is a function
names(numeric_vector) <- c("Pie","e","Phi")
numeric_vector
names(first_list) <- c("Numeric","Word","Complex","Boolean")
first_list
dimnames(second_mat) <- list(c("Row_1","Row_2","Row_3"),c("Col_1","Col_2"))
second_mat

#Tables
df_url <- fread('http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat')
df_import <- read.table('sample.dat')
df_csv <- read.csv("http://samplecsvs.s3.amazonaws.com/SacramentocrimeJanuary2006.csv")
df_real_csv <- df_csv[!is.na(df_csv)]
random_csv <- df_real[-c(2,10),]

# Subsetting
subset_vector <- character_vector[1:4]
subset_vector
subset_1_vector <- character_vector[character_vector > "d"]
subset_1_vector
subset_2_vector <- character_vector>"c"
subset_2_vector

identical(subset_1_vector,subset_2_vector)

#Data Frames
class(mtcars)
dim(mtcars)
nrow(mtcars)
ncol(mtcars)
object.size(mtcars)







