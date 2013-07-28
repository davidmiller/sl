library(gdata)

here <- "/home/david/src/proj/sl/datasets/crime/csew/"
data <- paste0(here, "data/")


total.crime <- read.xls("http://www.ons.gov.uk/ons/rel/crime-stats/crime-statistics/period-ending-december-2012/chd-figure-1-and-3.xls")
csew <- data.frame(t(total.crime[2:4,2:32]))
colnames(csew) <- c("year", "csew.crime", "recorded.crime")
csew$csew.crime <- as.numeric(gsub(",", "", csew$csew.crime)) * 1000
csew$recorded.crime <- as.numeric(gsub(",", "", csew$recorded.crime)) * 1000
write.csv(csew, file=paste0(data, "csew.total.csv"), row.names=FALSE)

violent.crime <- read.xls("http://www.ons.gov.uk/ons/rel/crime-stats/crime-statistics/period-ending-december-2012/chd-figure-4.xls")
violence <- data.frame(t(violent.crime[2:4, 2:20]))
colnames(violence) <- c("year", "nonsense", "crimes")
violence <- subset(violence, select=c("year", "crimes"))
violence$crimes <- as.numeric(gsub(",", "", violence$crimes)) * 1000
write.csv(violence, file=paste0(data, "csew.violent.crimes.csv"), row.names=FALSE)

