#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 30:00:00
#SBATCH -J pilon_polish
#SBATCH --mem=32GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/02_genome_assembly/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/02_genome_assembly/%x.%j.err

# Load modules
module load  Pilon/1.24-Java-17

REFERENCE=/home/edni0914/Genome-Analysis-Project/results/02_genome_assembly/flye/assembly.fasta
ALIGNED_READ=/home/edni0914/Genome-Analysis-Project/results/05_mapping/chr3_bwa_aligned_reads.bam
OUTDIR=/home/edni0914/Genome-Analysis-Project/results/02_genome_assembly/pilon

# Commands - 
java -Xmx16G -jar $EBROOTPILON/pilon.jar \
--threads 2 \
--genome $REFERENCE \
--bam $ALIGNED_READ \
--output pilon_polished_assemble \
--outdir $OUTDIR
