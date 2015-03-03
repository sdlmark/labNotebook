# read in countNotes.txt data for results from different HTSeq parameters
# 3 March 2015

setwd("~/labNotebook/")

rawdata = as.data.frame(read.table("countNotes.txt"))

colnames(rawdata) = c("sample", "type", "feature", "stranded", "mode", "gff", "genes", "nonzero", "no_feature", "ambiguous", "not_unique", "total_reads")

prop_counted = (rawdata$total_reads - (rawdata$no_feature+rawdata$ambiguous+rawdata$not_unique))/rawdata$total_reads 

prop_expr = rawdata$nonzero/rawdata$genes
prop_ambig = rawdata$ambiguous/rawdata$total_reads
prop_multimap = rawdata$not_unique/rawdata$total_reads

paramdata = cbind(rawdata, prop_counted, prop_expr, prop_ambig, prop_multimap)
paramdata

write.csv(as.data.frame(paramdata), "~/labNotebook/htseqprelimdata.csv")
write.table(as.data.frame(paramdata), "~/labNotebook/htseqprelimdata.txt")

#totalcounts = rawdata$nonzero + rawdata$no_feature + rawdata$ambiguous + rawdata$not_unique
#totalcounts
#rawdata$total_reads

#count_compare = data.frame(totalcounts, rawdata$total_reads)

