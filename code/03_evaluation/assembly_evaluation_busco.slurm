#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:20:00
#SBATCH -J busco_evaluation 
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/03_evaluation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/03_evaluation/%x.%j.err 

# load module 
module load BUSCO/5.8.2-gfbf-2024a 


INPUT=/home/edni0914/Genome-Analysis-Project/results/02_genome_assembly/pilon/pilon_polished_assemble.fasta
OUTDIR=busco

#Commands 
busco \
--in $INPUT \
--lineage_dataset embryophyta_odb10 \
--out $OUTDIR \
--mode genome 