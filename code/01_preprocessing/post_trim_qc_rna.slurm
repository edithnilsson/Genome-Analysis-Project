#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH -J FastQC_rna_post
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/01_preprocessing/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/01_preprocessing/%x.%j.err

# Load modules
module load FastQC/0.12.1-Java-17


INPUT=/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/ .... resten av vägen när den finns

# Commands
for x in $INPUT
do 
    echo "x = $x"
    fastqc --threads 1\
    $x \
    --outdir /home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/FastQC 

done



fastqc \
--outdir /home/edni0914/Genome-Analysis-Project/results/01_preprocessing/FastQC \
--threads 1 \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/Trimming/chr3_illumina_R1_trimmed_paired.fastq.gz \
/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/Trimming/chr3_illumina_R2_trimmed_paired.fastq.gz 