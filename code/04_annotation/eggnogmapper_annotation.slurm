#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J EggNogMapper_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err

#load module 
module load eggnog-mapper/2.1.13-gfbf-2024a

OUTDIR=/home/edni0914/Genome-Analysis-Project/results/04_annotation/eggnog

#commands 
emapper.py \
-i STRUCTURAL ANNOTATION \
-output eggnog_annotation \
--output_dir $OUTDIR \
--cpu 2 \
--itype proteins \
--decorate_gff Någon path \
--go_evidence experimental \
--decorate_gff_ID_field ID \
--data_dir /sw/data/uppnex/eggNOG/5.0/rackham/