#!/bin/bash
#This script do the quality analysis of sequencing with fastqc

# Create output directory
mkdir ../data/soja/fastqcs 

## fastqc
for i in ../data/soja/*.fastq.gz;
do fastqc $i -o ../data/soja/fastqcs
done
