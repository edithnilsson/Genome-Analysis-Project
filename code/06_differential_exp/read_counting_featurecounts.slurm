#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH --reservation=uppmax2026-1-61_8
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J featureCounts
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/06_differential_exp/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/06_differential_exp/%x.%j.err 


#load module
module load Subread/2.1.1-GCC-13.3.0

GTF=/home/edni0914/Genome-Analysis-Project/results/04_annotation/braker3/braker.gtf
OUT=/home/edni0914/Genome-Analysis-Project/results/06_differential_expression/counts.txt
HISAT2=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat

featureCounts -T 2 -p --countReadPairs \
-t exon -g gene_id -a $GTF -o $OUT ${HISAT2}/*mapped_rna.bam