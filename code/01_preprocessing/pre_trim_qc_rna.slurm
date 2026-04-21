#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -J FastQC_rna_pre
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/%x.%j.out
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/01_preprocessing/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/01_preprocessing/%x.%j.err
# Load modules
module load FastQC/0.12.1-Java-17


INPUT=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/*.fq.gz

# Commands

for x in $INPUT
do 
    echo "x = $x"
    fastqc --threads 1\
    $x \
    --outdir /home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/FastQC 

done

