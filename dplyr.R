## General Introduction
# dplyr and tidyr is a fast and powerful R package used  manipulating tabular data.
# It allow you to work with tabular data from a variety of sources, including data frames, data tables, databases and multidimensional arrays. 
# "The dplyr philosophy is to have small functions that each do one thing well." Specifically, dplyr
# supplies five 'verbs' that cover most fundamental data manipulation tasks: select(), filter(),
# arrange(), mutate(), and summarize().

## General Synatx: 
df_iris <- iris

# *Convert to tbl_df format:
tbl_iris <- tbl_df(df_iris)

# tbl_df helps to view data in a user-friendly format. 
# *View data in console:
tbl_iris
# Informationd dense summary of data. 
# *One row of data for the first five columns/variables:
glimpse(iris)

# *View data set in spreadsheet-like display (note capital V)
View(iris)

## Summarise Data
# Calculations that summarize particular columns, eg: avg, min, max etc. 
# Calculations eq. to GROUP BY in SQL

# Apply summary function to a particular column
# *Average of a particular column
avg_sepal_length <- summarise(tbl_iris,avg_sepal_length = mean(Sepal.Length))
View(avg_sepal_length)

# Apply summary function to each column
# *Average of all columns of a table
avg_tbl_iris <- summarise_each(tbl_iris, funs(mean))
View(avg_tbl_iris)

# *Count of each unique value
count_unique_species <- count(iris, Species)
View(count_unique_species)
# *Count of each unique value with weights
count_weighted_species <- count(iris, Species, wt = Sepal.Length)
View(count_weighted_species)

# Summary functions
# First value
first_sepal_width <- summarise(tbl_iris,first_sepal_width = first(Sepal.Width))
# Last value
last_sepal_width <- summarise(tbl_iris,first_sepal_width = last(Sepal.Width))
# nth value
nth_sepal_width <- summarise(tbl_iris,first_sepal_width = nth(Sepal.Width,3))
# n values
count_tbl_iris <- summarise(tbl_iris,count_rows = n())
# n distinct values
# count_distinct_tbl_iris <- summarise(tbl_iris,count_rows = n_distinct())
# min, max,mean,median,var,sd can be done in the following ways:
min_sepal_length <- summarise(tbl_iris,min_sepal_length = min(Sepal.Length))
max_sepal_length <- summarise(tbl_iris,min_sepal_length = max(Sepal.Length))
median_sepal_length <- summarise(tbl_iris,min_sepal_length = median(Sepal.Length))
sd_sepal_length <- summarise(tbl_iris,sd_sepal_length = sd(Sepal.Length))

## Group data
df_grouped_species <- group_by(iris,Species)
View(df_grouped_species)

# Average after group by
# Compute summary for each group: eq. of species,average(species), group by 1 in SQL
df_avg_length_species <- iris %>%
                            group_by(Species) %>%
                            summarize(avg_length = mean(Sepal.Length))
View(df_avg_length_species)

## Make New Variables
df_sum_iris <- mutate(iris,sepal = Sepal.Length + Sepal.Width)
# Apply window function
df_min_rank_iris <- mutate_each(iris,funs(min_rank))
View(df_min_rank_iris)

# Drop old columns and replace with new columns
df_transmutate_iris <- transmute(iris,sepal = Sepal.Length + Sepal.Width)
View(df_transmutate_iris)

## Window functions
df_lead_iris <- mutate(iris,lead_sepal_length = lead(Sepal.Length,1))
df_lag_iris <- mutate(iris,lead_sepal_length = lag(Sepal.Length,1))
# Ties get different ranks
df_dense_rank_iris <- mutate(iris,dense_rank_length = dense_rank(Sepal.Length))
# Ties get same rank
df_min_rank_iris1 <- mutate(iris,min_rank = min_rank(Sepal.Length))
# Row number
df_row_number_iris <- mutate(iris,row_numbers = row_number(Sepal.Length))


### Subset Obversations (Row-wise)
# Filter on one column
length_greater_7 <- filter(iris,Sepal.Length > 7)
View (length_greater_7)
# Distinct rows across tables. Remove duplicate rows
distinct_iris <- distinct(iris)
# Randomly select fraction of rows
sample_iris <- sample_frac(iris,0.5,replace = TRUE)
View(sample_iris)

sample_n_iris <- sample_n(iris,10,replace = TRUE)
View(sample_n_iris)

# Select rows by position. Get a slice of data
slice_iris <- slice(iris,10:15)
View(slice_iris)

top_n_iris <- top_n(iris,4,Sepal.Length)
View(top_n_iris)

# Logic in r

# <       Less than                   !=      Not equal to
# >       Greater than                %in%    Group membership
# ==      Equal to                    is.na   Is NA
# !is.na  Is not NA                   &,|,xor,any,all     Boolean operators

### Subset columns (Variables)
# Select individual columns
col_iris <- select(iris,Sepal.Width,Petal.Length,Species)
# Columns that contain a string
col_dot_iris <- select(iris,contains("."))
View(col_dot_iris)
col_ends_with_iris <- select(iris,ends_with("Length"))
View(col_ends_with_iris)
col_everything_iris <- select(iris,everything())
View(col_everything_iris)
# Column LIKE something/matches something
col_like_iris <- select(iris,matches(".t"))
View(col_like_iris)
# Select Ranged columns like x1,x2 etc
select(iris, num_range("x", 1:5))
select(iris, one_of(c("Species", "Genus")))
# Select columns whose names are in a group of names.
select(iris, starts_with("Sepal"))
# Select columns whose name starts with a character string.
select(iris, Sepal.Length:Petal.Width)
# Select all columns between Sepal.Length and Petal.Width (inclusive).
select(iris, -Species)
# Select all columns except Species. 




#### tidyr package

# 1) Each variable is saved in a column
# 2) Each observation is saved in a row
# 3) Each type of observational unit forms a table

# Tidy data complements R’s vectorized operations. 
# R will automatically preserve observations as you manipulate variables.
# No other format works as intuitively with R. 
# Any dataset that doesn't satisfy these conditions is considered 'messy' data.






# So easy to select columns!
# select(cran,ip_id,package,country)

# select(cran,r_arch:country)
# select(cran,-time)

# Now that you know how to select a subset of
# | columns using select(), a natural next
# | question is "How do I select a subset of
# | rows?" That's where the filter() function
# | comes in.

# filter(cran,!is.na(r_version))

# arrange(cran2,ip_id)
# Arrange the dataset cran2 on the column ip_id ascending
# arrange(cran2,country,desc(r_version),ip_id)
# Add a new column with a modification
#  mutate(cran3, size_mb = size / 2^20)
# # One very nice feature of mutate() is that you can use the value
# | computed for your second column (size_mb) to create a third
# | column, all in the same line of code. To see this in action,
# | repeat the exact same command as above, except add a third
# | argument creating a column that is named size_gb and equal to
# | size_mb / 2^10.

# In the last lesson, you learned about the five main data
# | manipulation 'verbs' in dplyr: select(), filter(), arrange(),
# | mutate(), and summarize(). The last of these, summarize(), is
# | most powerful when applied to grouped data.

# The 'count' column, created with n(), contains the total number of rows (i.e. downloads) for each package. The 'unique' column, created with
# | n_distinct(ip_id), gives the total number of unique downloads for each package, as measured by the number of distinct ip_id's. The
# | 'countries' column, created with n_distinct(country), provides the number of countries in which each package was downloaded. And finally,
# | the 'avg_bytes' column, created with mean(size), contains the mean download size (in bytes) for each package.
# 
# ...
# 
# |====================                                      |  35%
# 
# | It's important that you understand how each column of pack_sum was created and what it means. Now that we've summarized the data by
# | individual packages, let's play around with it some more to see what we can learn.
# 
# ...
# 
# |=====================                                     |  37%
# 
# | Naturally, we'd like to know which packages were most popular on the day these data were collected (July 8, 2014). Let's start by isolating
# | the top 1% of packages, based on the total number of downloads as measured by the 'count' column.
# 
# ...

# quantile(pack_sum$count, probs = 0.99)

# Chaining allows you to string together multiple function calls in
# | a way that is compact and readable, while still accomplishing the
# | desired result. To make it more concrete, let's compute our last
# | popularity metric from scratch, starting with our original data.
# 

