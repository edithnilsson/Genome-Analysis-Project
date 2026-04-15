#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/05_mapping/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/05_mapping/%x.%j.err 

# Load modules
module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0

# variables 
REFERENCE=/home/edni0914/Genome-Analysis-Project/results/02_genome_assembly/assembly.fasta
READ1=/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/Trimming/chr3_illumina_R1_trimmed_paired.fastq.gz
READ2=/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/Trimming/chr3_illumina_R2_trimmed_paired.fastq.gz
OUTDIR=/home/edni0914/Genome-Analysis-Project/results/05_mapping

# Commands 
bwa-mem2 index $REFERENCE
bwa-mem2 mem -t 2 $REFERENCE $READ1 $READ2 | \
samtools sort -o $OUTDIR/chr3_bwa_aligned_reads.bam
samtools index $OUTDIR/chr3_bwa_aligned_reads.bam