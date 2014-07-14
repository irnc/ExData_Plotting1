zipUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
zipFile <- 'household_power_consumption.zip'
txtFile <- 'household_power_consumption.txt'

if (!file.exists(zipFile)) {
  download.file(zipUrl, destfile=zipFile, method='curl')
}

if (!file.exists(txtFile)) {
  unzip(zipFile)
}

filter <- "awk 'BEGIN {FS=\";\"} {if ($1 == \"1/2/2007\" || $1 == \"2/2/2007\") print $0}'"
piped <- pipe(paste(c(filter, txtFile), collapse=' '))
data <- read.table(piped, sep=';')
