#!/bin/bash

# This script do mapping whith bwa 
# Prerequisite: intall bwa 0.7.17-r1188
# Working directory is /bin/
# Genome reference is /data/soja
# Samples /data/raw/soja


#First mapping with wild reference genome 
# Index genome reference 
bwa index ../data/soja/GCA_004193775.2_ASM419377v2_genomic.fna

## Create uotput directory
mkdir -p ../data/soja/mapwild2

### Mapping 
bwa mem -t 6 -M ../data/soja/GCA_004193775.2_ASM419377v2_genomic.fna ../data/soja/clean/SRR1030613_1_val_1.fq.gz ../data/soja/clean/SRR1030613_2_val_2.fq.gz > ../data/soja/mapwild2/soja_wild.sam

#Second mapping with domesticated reference genome 
#Index genome reference 
bwa index ../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.fna

## Create uotput directory
mkdir -p ../data/soja/mapdomesticated

### Mapping 
bwa mem -t 6 -M ../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.fna ../data/soja/clean/SRR1030613_1_val_1.fq.gz ../data/soja/clean/SRR1030613_2_val_2.fq.gz > ../data/soja/mapdomesticated/soja_dom.sam

