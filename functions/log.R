library(logging);

# Logging configuration
basicConfig(level='FINEST');
# Level = INFO | DEBUG
setLevel(getHandler('basic.stdout'), level='DEBUG'); 

# # output file
# outputFile <- paste("results/", gname, "-", metric, ".txt", sep="");
# addHandler(writeToFile, file=outputFile, level='INFO');
# # close
# removeHandler(writeToFile);