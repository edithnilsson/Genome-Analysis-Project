#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH --reservation=uppmax2026-1-61_7
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH --mem=50GB
#SBATCH -J Hisat2-loop
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err


#module load
module load HISAT2/2.2.1-gompi-2024a
module load SAMtools/1.22.1-GCC-13.3.0

pilon_polished_assemble=/home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble.fasta.masked
indexed_polished_assemble=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat2_index
read_f1=/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/*f1_trimmed_paired.fastq.gz
OUTDIR=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat2_out
#commands
hisat2-build "$pilon_polished_assemble" "$indexed_polished_assemble"


for f1 in $read_f1
do 
    echo "processing: $f1" 
    filename=$(basename "$f1" _f1_trimmed_paired.fastq.gz)
    echo "working on: $filename"

    r2=/home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/${filename}_r2_trimmed_paired.fastq.gz

    echo "arbetar med:" 
    echo "forward = $f1" 
    echo "revers = $r2" 

    cd $OUTDIR
    hisat2 -p 2\
    -x "$indexed_polished_assemble" \
    -1 $f1 \
    -2 $r2 | \
    samtools sort -o $OUTDIR/${filename}_mapped.bam
    samtools index "$OUTDIR/${filename}_mapped.bam"

done