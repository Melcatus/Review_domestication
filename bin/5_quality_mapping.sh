#!/bin/bash
# Index 
#wild 
samtools index ../data/soja/mapwild3/soja_wild_sorted_RG.bam
# domesticated 
samtools index ../data/soja/mapdom3/soja_dom_sorted_RG.bam

## Qualimap 
# wild
../qualimap_v2.2.1/qualimap bamqc --java-mem-size=10G -bam ../data/soja/mapwild3/soja_wild_sorted_RG.bam -gff ../data/soja/GCA_004193775.2_ASM419377v2_genomic.gff -outdir ../data/soja/mapwild2 -nw 400 -hm 3
# domesticated
../qualimap_v2.2.1/qualimap bamqc --java-mem-size=10G -bam ../data/soja/mapdom3/soja_dom_sorted_RG.bam -gff ../data/soja/dom.gff -outdir ../data/soja/mapdom3 -nw 400 -hm 3
