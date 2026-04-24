#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 10:00:00
#SBATCH -J RepeatMasker
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err

#load module
module load RepeatModeler/2.0.7-foss-2024a
moule load RepeatMasker/4.2.1-foss-2024a 

#Commands  

INPUT=/home/edni0914/Genome-Analysis-Project/results/02_genome_assembly/pilon/pilon_polished_assemble.fasta
db_name="n_jap_chr3_repeat_db"
modeler_out="/home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmodeler"
masker_out="/home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker" 

#step 1
cd "$modeler_out"
BuildDatabase -name  "$db_name" $INPUT 

#step 2
RepeatModeler -database "$db_name" -threads 2 -LTRStruct

#step 3
cd "$masker_out"
RepeatMasker -xsmall -lib $modeler_out/$db_name-families.fa $INPUT -pa 2 -gff -nolow 