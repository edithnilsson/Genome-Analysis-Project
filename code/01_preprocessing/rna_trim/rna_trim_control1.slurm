#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH -J Trimmomatic_rna_control1
#SBATCH --mem=16GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user=edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/01_preprocessing/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/01_preprocessing/%x.%j.err

#Load modules
module load Trimmomatic/0.39-Java-17

#commands

trimmomatic PE -threads 2 \
/home/edni0914/Genome-Analysis-Project/transcriptomic_data/Control_1_f1.fq.gz \
/home/edni0914/Genome-Analysis-Project/transcriptomic_data/Control_1_r2.fq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/control_1_f1_trimmed_paired.fastq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/control_1_f1_trimmed_unpaired.fastq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/control_1_r2_trimmed_paired.fastq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/control_1_r2_trimmed_unpaired.fastq.gz \
ILLUMINACLIP:/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50