#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J Trimmomatic_illumina
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/01_preprocessing/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/01_preprocessing/%x.%j.err
#Load modules
module load Trimmomatic/0.39-Java-17

#commands

trimmomatic PE -threads 2 \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/Trimming/chr3_illumina_R1_trimmed_paired.fastq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/Trimming/chr3_illumina_R1_trimmed_unpaired.fastq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/Trimming/chr3_illumina_R2_trimmed_paired.fastq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/Trimming/chr3_illumina_R2_trimmed_unpaired.fastq.gz \
ILLUMINACLIP:/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50