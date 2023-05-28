library(reshape2)

data_read <- function(p,s = 0){
	data <- read.csv(p,header = F,skip = s)
	names <- data[1,]
	data <- data[-1,]
	names(data) <- names
	return(data)
}

args <- commandArgs(T)

root <- getwd()
dir <- list.dirs(paste0(root,"/原始数据"))

PNL_Data <- data_read("./原始数据/PNL.csv")

for(i in dir[-1]){
  csv_files <- list.files(i,pattern = ".csv")
  for(j in csv_files){
    k <- data_read(paste0(i,"/",j),1)
    Full_Data <- merge(x = k, y = PNL_Data, by = "serialnumber", all = TRUE)
    names <- c("site","serialnumber","config","build","starttime","endtime","status","test failing","PNL_ID","MP9 Item","Item Value")
    t <- melt(Full_Data,id = names[1:9])
    names(t) <- names
    
    #len <- as.numeric(args[1])
    len <- 100000
    l = 1
    while((l-1)*len+1 < length(t[,1])){
      m <- (l-1)*len+1
      n <- l*len
      if(n > length(t[,1]))
        n <- length(t[,1])
      write.table(t[m:n,],file = paste0(root,"/result/",strsplit(j, '.csv'),"_",l,".csv"),col.names = T,row.names = F,na = "",sep = ",",quote = F)
      l <- l + 1
    }
  }
}