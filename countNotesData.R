# read in countNotes.txt data for results from different HTSeq parameters
# 3 March 2015

setwd("~/labNotebook/")

rawdata = as.data.frame(read.table("countNotes.txt"))

colnames(rawdata) = c("sample", "type", "feature", "stranded", "mode", "gff", "genes", "nonzero", "no_feature", "ambiguous", "not_unique", "total_reads")

# paramdata()

prop_counted = (rawdata$total_reads - rawdata$no_feature)/rawdata$total_reads 

paramdata = cbind(rawdata, prop_counted)
paramdata


