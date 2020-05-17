#!/bin/bash
# Annotation 
# wild 
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar Annotate ../data/soja/mapwild2/soja_wild_3.vcf ../data/soja/GCA_004193775.2_ASM419377v2_genomic.gff ../data/soja/GCA_004193775.2_ASM419377v2_genomic.fna 1> ../data/soja/mapwild2/soja_wild_annotated.vcf

# domesticated 
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar Annotate ../data/soja/mapdomesticated/soja_dom_3.vcf ../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.gff ../data/soja/GCF_000004515.5_Glycine_max_v2.1_genomic.fna 1> ../data/soja/mapdomesticated/soja_dom_annotated.vcf

## Statistics
# wild 
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar SummaryStats -m 1 ../data/soja/mapwild2/soja_wild_annotated.vcf 1> ../data/soja/mapwild2/soja_wild_summary.stats

# domesticated 
java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar SummaryStats -m 1 ../data/soja/mapdomesticated/soja_dom_annotated.vcf 1> ../data/soja/mapdomesticated/soja_dom_summary.stats
