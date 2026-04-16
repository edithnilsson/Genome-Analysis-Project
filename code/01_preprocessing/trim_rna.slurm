#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J Trimmomatic_rna
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/01_preprocessing/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/01_preprocessing/%x.%j.err

#Load modules
module load Trimmomatic/0.39-Java-17

#commands

f1=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/*f1.fq.gz

INPUT=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/*.fq.gz
OUTPUT=/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming

for i in $f1
do 
    echo "i = $i"
    filename=$(basename "$i" _f1.fq.gz)
    echo "working on: $filename"
    r2=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/${filename}_r2.fq.gz
    
    echo "arbetar med:" 
    echo "forward = $i" 
    echo "revers = $r2" 

    trimmomatic PE -threads 2 \
    $i \
    $r2 \
    "$OUTPUT/${filename}_f1_trimmed_paired.fq.gz" \
    "$OUTPUT/${filename}_f1_trimmed_unpaired.fq.gz"\
    "$OUTPUT/${filename}_r2_trimmed_paired.fq.gz" \
    "$OUTPUT/${filename}_r2_trimmed_unpaired.fq.gz" \
    ILLUMINACLIP:/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50
      

done
