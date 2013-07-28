library(gdata)

here <- "/home/david/src/proj/sl/datasets/conception/"
data <- paste0(here, "data/")

teenage.conceptions <- read.xls(paste0(here,
                                       "conceptionstatisticstables2011final_tcm77-301853.xls")
                                , sheet="Table 1")

cols <- c("year", "total.conceptions", "leading.to.maternities",
          "aborted", "per.1k", "percentage.aborted", "percentage")
colnames(teenage.conceptions) <- cols

teenage.conceptions$total.conceptions <- as.numeric(gsub(",", "", teenage.conceptions$total.conceptions))
teenage.conceptions$leading.to.maternities <- as.numeric(gsub(",", "", teenage.conceptions$leading.to.maternities))
teenage.conceptions$aborted <- as.numeric(gsub(",", "", teenage.conceptions$aborted))
teenage.conceptions$percentage <- teenage.conceptions$per.1k / 10


write.csv(teenage.conceptions[2:15,1:7], file=paste0(data, "under.16.csv"), row.names=FALSE)
write.csv(teenage.conceptions[17:30,1:7], file=paste0(data, "under.14.csv"), row.names=FALSE)
write.csv(teenage.conceptions[32:45,1:7], file=paste0(data, "age.14.csv"), row.names=FALSE)
write.csv(teenage.conceptions[47:60,1:7], file=paste0(data, "age.15.csv"), row.names=FALSE)
write.csv(teenage.conceptions[62:75,1:7], file=paste0(data, "age.16.csv"), row.names=FALSE)
write.csv(teenage.conceptions[77:90,1:7], file=paste0(data, "age.17.csv"), row.names=FALSE)
write.csv(teenage.conceptions[92:105,1:7], file=paste0(data, "age.18.csv"), row.names=FALSE)
write.csv(teenage.conceptions[107:120,1:7], file=paste0(data, "age.19.csv"), row.names=FALSE)
