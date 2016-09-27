# This is the second file talking about basic introductory commands

getwd()                                         # Get Working Directory
setwd("/Users/jsingh/Desktop/R")                # Set Working Directory
ls()                                            # List the objects in the current working space
R.Version()$arch                                # Checking architecture of R
cat("\014")                                     # Clear console of previous commands
ls()                                            # Lists all variables loaded
help(options)                                   # learn about available options
options()                                       # view current option settings
options(digits=3)                               # number of digits to print on output

# work with your previous commands
history()                                       # display last 25 commands
history(max.show=Inf)                           # display all previous commands

# save your command history 
savehistory(file="myfile")                      # default is ".Rhistory" 

# recall your command history 
loadhistory(file="myfile")                      # default is ".Rhistory"
save.image()                                    # save the workspace to the file .RData in the cwd 

# system architecture information
Sys.info()["machine"]                           # Check architecture of machine (whether 32 or 64 bit)
Sys.info()["sysname"]                           # Check architecture of machine (whether 32 or 64 bit)
Sys.info()                                      # All other details