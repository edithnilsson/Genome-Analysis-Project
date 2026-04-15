#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:40:00
#SBATCH -J FastQC_illumina_pre
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/%x.%j.out

# Load modules
module load FastQC/0.12.1-Java-17


# Commands

fastqc \
--outdir /home/edni0914/Genome-Analysis-Project/results/01_preprocessing \
--threads 1 \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz  

