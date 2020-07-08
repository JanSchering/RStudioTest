pollutantmean <- function(directory, pollutant, id = 1: 332) {
  indexAsStringVector <- sapply(id, FUN = toString)
  filePaths <- sapply( "./", sapply(directory, indexAsStringVector, FUN = paste, sep="/"), ".csv", FUN = paste, sep="" )
  pollutantMeans <- vector()
  
  for (path in filePaths) {
    file <- read.csv(file = path)
    pollutantData <- file[[pollutant]]
    cleaned <- pollutantData[!is.na(pollutantData)]
    pollutantMeans <- c( pollutantMeans, mean(cleaned) )
  }
  
  mean(pollutantMeans)
    
}