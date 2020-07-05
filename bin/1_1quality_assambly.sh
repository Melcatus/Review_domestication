#!/bin/bash

#This script run QUAST to evaluate the quality of assemblies 
#Prerequisite: download QUAST v.5.0.2, python
#The assamblies are in /data/soja/ and in /data/rice/ 

# Reference genome  wild soja  
python ../quast-5.0.2/quast.py ../data/soja/GCA_004193775.2_ASM419377v2_genomic.fna

# Reference genome domesticated soja
python ../quast-5.0.2/quast.py ../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.fna

# Reference genome wild rice
python ../quast-5.0.2/quast.py  ../data/arroz/Oryza_barthii.O.barthii_v1.dna.toplevel.fa

# Reference genome domesticated rice 
python ../quast-5.0.2/quast.py ../data/arroz/Oryza_glaberrima.Oryza_glaberrima_V1.dna.toplevel.fa
