#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 18:00:00
#SBATCH -J EggNogMapper_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err

#load module 
module load eggnog-mapper/2.1.13-gfbf-2024a

IN=/home/edni0914/Genome-Analysis-Project/results/04_annotation/braker3/braker.aa
OUTDIR=/home/edni0914/Genome-Analysis-Project/results/04_annotation/eggnog
DATA=/sw/data/uppnex/eggNOG/5.0/rackham/
GTF=/home/edni0914/Genome-Analysis-Project/results/04_annotation/braker3/braker.gtf


#commands 
emapper.py \
    -i $IN\
    --output eggnog_mapper \
    --output_dir $OUTDIR \
    --cpu 2 \
    --itype proteins \
    --decorate_gff $GTF \
    --decorate_gff_ID_field ID \
    --go_evidence experimental \
    --excel \
    --data_dir $DATA