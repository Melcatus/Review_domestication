#!/bin/bash
# This script do the quality of sequencing with fastqc
# Install Fastqc_v0.11.8 

# Create output directory
mkdir ../data/soja/fastqcs 

## fastqc
for i in ../data/soja/*.fastq.gz;
do fastqc $i -o ../data/soja/fastqcs
done
