
# Function to convert string with all words 

leading_caps <- function(x){
    s <- strsplit(x," ")[[1]]
    paste(toupper(substring(s,1,1),substring(s,2),sep = "",collapse=" "))
}