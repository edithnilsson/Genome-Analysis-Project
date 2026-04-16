#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J RepeatMasker
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err

#load module
moule load RepeatMasker/4.2.1-foss-2024a 

#Commands   ---> vill man ha en slower seach??? och använda -s?
RepeatMasker