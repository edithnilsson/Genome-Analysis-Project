#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH -J quast_evaluation 
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/03_evaluation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/03_evaluation/%x.%j.err 


# load module 
module load QUAST/5.3.0

INPUT=/home/edni0914/Genome-Analysis-Project/results/02_genome_assembly/pilon/pilon_polished_assemble.fasta
OUTDIR=/home/edni0914/Genome-Analysis-Project/results/03_evaluation/quast

#commands
quast.py $INPUT -o $OUTDIR  --threads 1 
