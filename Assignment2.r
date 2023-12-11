getwd()
setwd("/Users/wangyuewen/Library/CloudStorage/OneDrive-个人/BigData/assignment_idaccuracy/Aminer")
rm(list = ls())

#1.使用for循环
a <- list.files(pattern = ".csv")
a
dir = paste("./",a,sep="")
n = length(dir)
merge.data = read.csv(file = dir[1],header=TRUE,sep=",")
install.packages(c("dplyr","readr","jsonlite"))
library(dplyr)
for (i in 2:n){
  new.data = read.csv(file = dir[i], header=TRUE, sep=",")
  merge.data = bind_rows(merge.data,new.data)
}
write.csv(merge.data,file = "./merge_all.csv",row.names=FALSE)
merge.data

#2.使用lapply读取所有csv文件并合并
rm(list = ls())
a <- list.files(pattern = ".csv")

merge.data <- do.call(bind_rows, lapply(a, read.csv))

# 输出合并后的data.frame
print(merge.data)


#3.函数模块化
#将文件存储在路径"/Users/wangyuewen/Library/CloudStorage/OneDrive-个人/BigData/assignment_idaccuracy"
source("Assignment2.R")
