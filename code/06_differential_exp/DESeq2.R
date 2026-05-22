rm(list = ls())

# Installation of libraries
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install("DESeq2") # Behöver bara köras en gång

library(DESeq2)
library(data.table)
library(ggplot2)


setwd("~/Desktop/Universitet/År4/Genomanalys/DESeq2")

# Load data and read data 
countdata <- read.table("counts.txt", header = TRUE, row.names = 1, check.names = FALSE, skip = 1)
colnames(countdata)
count_matrix <- countdata[, 6:ncol(countdata)]
colnames(count_matrix)

# Rename all columns: 
colnames(count_matrix) <- c("Control_1", "Control_2", "Control_3", "Heat_1", "Heat_2", "Heat_3")
colnames(count_matrix)

#create "facit" 
metadata <- data.frame(
  condition = factor(c("Control", "Control", "Control", "Heat", "Heat", "Heat")),
  row.names = colnames(count_matrix)
)
all(colnames(count_matrix) == rownames(metadata))


# Create DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData = count_matrix,
                              colData = metadata,
                              design = ~ condition) 

# Set up a reference group so Heat is compared with Control
dds$condition <- relevel(dds$condition, ref = "Control")

dds <- DESeq(dds)

res <- results(dds)


# sort data based on significance 
res_ordered <- res[order(res$padj), ]

# The 10 gene swith biggest imapct
head(res_ordered)

# Write it to a csv file
write.csv(as.data.frame(res_ordered), file = "differential_expression_results.csv")

