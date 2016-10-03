#In this lesson, you'll learn how to manipulate data using dplyr. dplyr is a fast and powerful R package used  manipulating tabular data.
#One unique aspect of dplyr is that the same set of tools allow you to work with tabular data from a variety of sources, including data frames, data tables, databases and multidimensional arrays. 
# "CRAN is a network of ftp and web servers around the world that store identical, up-to-date, versions of code and documentation for R"

# cran <- tbl_df(mydf)

# "The dplyr philosophy is to have small functions that each do one thing well." Specifically, dplyr
# supplies five 'verbs' that cover most fundamental data manipulation tasks: select(), filter(),
# arrange(), mutate(), and summarize().

# So easy to select columns!
# select(cran,ip_id,package,country)
