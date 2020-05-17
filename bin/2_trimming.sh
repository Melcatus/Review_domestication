#!/bin/bash

# This script is for data cleaning using trim_galore.
# Run this script from directory /bin/  and  the sequences they are in /data/soja
# Prerequisites: install trim_galore 0.4.4_dev

# Create output directory
mkdir -p ../data/soja/clean

## trimming
./TrimGalore-0.6.0/trim_galore --fastqc --paired --length 80 --clip_R1 10 --clip_R2 10 --three_prime_clip_R1 10 --three_prime_clip_R2 10 --illumina -o ../data/soja/clean ../data/soja/SRR1030613_1.fastq.gz ../data/soja/SRR1030613_2.fastq.gz
