# tidyr package
# | Tidy data is formatted in a standard way that facilitates
# | exploration and analysis and works seamlessly with other tidy
# | data tools. Specifically, tidy data satisfies three conditions:
#     | 
#     | 1) Each variable forms a column
# | 
#     | 2) Each observation forms a row
# | 
#     | 3) Each type of observational unit forms a table

# | Any dataset that doesn't satisfy these conditions is considered
# | 'messy' data. Therefore, all of the following are characteristics
# | of messy data, EXCEPT...
# 
# 1: Column headers are values, not variable names
# 2: Variables are stored in both rows and columns
# 3: A single observational unit is stored in multiple tables
# 4: Multiple types of observational units are stored in the same table
# 5: Multiple variables are stored in one column
# 6: Every column contains a different variable


# gather takes multiple columns and collapses into key-value pairs

# | The first column represents each of five possible grades that
# | students could receive for a particular class. The second and
# | third columns give the number of male and female students,
# | respectively, that received each grade.

?gather
gather(students, sex, count, -grade)
res <- gather(students2,sex_class,count)
res <- gather(students2,sex_class,count, -grade)

