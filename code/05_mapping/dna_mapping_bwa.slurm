#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/05_mapping%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/05_mapping%x.%j.err 

# Load modules
module load BWA/0.7.19-GCCcore-13.3.0


# variabels 
REFERENCE = 
READ1 =
READ2 =
OUTDIR = 

# Commands 
# vad gör -bS för något?????
bwa mem\ 
-t 2 \ 
-j "$REFERENCE" "$READ1" "$READ2" \ 
| samtools view -bS - > aligned_reads.bam