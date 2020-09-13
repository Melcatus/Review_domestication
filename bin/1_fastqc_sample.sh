#!/bin/bash
# This script do the quality of sequencing with fastqc
# Install Fastqc_v0.11.8 

# Create output directory
mkdir ../data/soja/fastqcs 
mkdir ../data/rice/fastqcs 

## fastqc to sample of soja 
for i in ../data/soja/*.fastq.gz;
do fastqc $i -o ../data/soja/fastqcs
done

## fastqc to sample of rice 
for i in ../data/rice/*.fastq.gz;
do fastqc $i -o ../data/rice/fastqcs
done
