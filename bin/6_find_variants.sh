#!/bin/bash
# total reads
# wild 
samtools view ../data/soja/mapwild2/soja_wild_sorted_RG.bam | wc -l >> ../data/soja/mapwild2/alignments_wild.txt  
# domesticated 
samtools view  ../data/soja/mapdomesticated/soja_dom_sorted_RG.bam | wc -l >> ../data/soja/mapdomesticated/alignments_dom.txt

## The fai index 
#wild
samtools faidx ../data/soja/GCA_004193775.2_ASM419377v2_genomic.fna
#domesticated
samtools faidx ../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.fna

### Find variants 
# wild 
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar FindVariants -runRep -runRD -runRP -maxAlnsPerStartPos 100 -csb -psp -algCNV CNVnator,EWT ../data/soja/GCA_004193775.2_ASM419377v2_genomic.fna ../data/soja/mapwild2/soja_wild_sorted_RG.bam ../data/soja/mapwild2/soja_wild >& ../data/soja/mapwild2/soja_wild.log

# domesticated 
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar FindVariants -runRep -runRD -runRP -maxAlnsPerStartPos 100 -csb -psp -algCNV CNVnator,EWT ../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.fna ../data/soja/mapdomesticated/soja_dom_sorted_RG.bam ../data/soja/mapdomesticated/soja_dom >& ../data/soja/mapdomesticated/soja_som.log

#### Merge 
#wild 
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar MergeVariants ../data/soja/GCA_004193775.2_ASM419377v2_genomic.fna.fai  ../data/soja/mapwild2/soja_wild2  ../data/soja/mapwild2/soja_wild.vcf  >& ../data/soja/mapwild2/soja_wild_merg.log 
#domesticated 
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar MergeVariants ../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.fna.fai  ../data/soja/mapdomesticated/soja_dom2 ../data/soja/mapdomesticated/soja_dom.vcf  >& ../data/soja/mapdomesticated/soja_dom_merg.log

##### Find variants
#wild
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar FindVariants -csb -psp -knownVariants ../data/soja/mapwild2/soja_wild2 -knownSVs ../data/soja/mapwild2/soja_wild_SV.gff  -maxBaseQS 30 -maxAlnsPerStartPos 100 -sampleId wild .../data/soja/GCA_004193775.2_ASM419377v2_genomic.fna ../data/soja/mapwild2/soja_wild_sorted_RG.bam ../data/soja/mapwild2/soja_wild_3 >& ../data/soja/mapwild2/soja_wild_var3.log
#domesticated
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar FindVariants -csb -psp -knownVariants ../data/soja/mapdomesticated/soja_dom2 -knownSVs ../data/soja/mapdomesticated/soja_dom_SV.gff  -maxBaseQS 30 -maxAlnsPerStartPos 100 -sampleId dom .../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.fna ../data/soja/mapdomesticated/soja_dom_sorted_RG.bam ../data/soja/mapdomesticated/soja_dom_3 >& ../data/soja/mapdomesticated/soja_dom_var3.log

