#!/bin/bash
# Convert aligment from sam to bam 
# sam to bam wild
java -jar -Xmx10000M ../picard.jar SamFormatConverter I=../data/soja/mapwild3/soja_wild.sam O=../data/soja/mapwild3/soja_wild.bam
# sam to bam domesticated 
java -jar -Xmx10000M ../picard.jar SamFormatConverter I=../data/soja/mapdom3/soja_dom.sam O=../data/soja/mapdom3/soja_dom.bam

## Sorted both files 
# wild 
java -jar -Xmx10000M ../picard.jar SortSam I=../data/soja/mapwild3/soja_wild.bam O=../data/soja/mapwild3/soja_wild_sorted.bam SO=coordinate
# domesticated 
java -jar -Xmx10000M ../picard.jar SortSam I=../data/soja/mapdom3/soja_dom.bam O=../data/soja/mapdom3/soja_dom_sorted.bam SO=coordinate

### Add group
# wild 
java -jar -Xmx10000M ../picard.jar AddOrReplaceReadGroups I=../data/soja/mapwild3/soja_wild_sorted.bam O=../data/soja/mapwild3/soja_wild_sorted_RG.bam ID=sample LB=Paired-end PL=Illumina PU=Unknown SM=sample
# domesticated
java -jar -Xmx10000M ../picard.jar AddOrReplaceReadGroups I=../data/soja/mapdom3/soja_dom_sorted.bam O=../data/soja/mapdom3/soja_dom_sorted_RG.bam ID=sample LB=Paired-end PL=Illumina PU=Unknown SM=sample

