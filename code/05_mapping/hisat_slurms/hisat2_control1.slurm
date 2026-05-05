#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH --reservation=uppmax2026-1-61_7
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 1:20:00
#SBATCH --mem=20GB
#SBATCH -J hisat2_mapping_control1
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err


#module load
module load HISAT2/2.2.1-gompi-2024a
module load SAMtools/1.22.1-GCC-13.3.0

pilon_polished_assemble=/home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble.fasta.masked
IDX=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/hisat_index

OUTDIR=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/control1
OUT_BAM="$OUTDIR/1_mapped_rna.bam"

#commands
hisat2-build "$pilon_polished_assemble" "$IDX"

hisat2 -p 2 \
-x "$IDX" \
-1 /home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/control_1_f1_trimmed_paired.fastq.gz \
-2 /home/edni0914/Genome-Analysis-Project/results/01_preprocessing/rna/Trimming/control_1_r2_trimmed_paired.fastq.gz \
| samtools sort -o "$OUT_BAM"

samtools index "$OUT_BAM"
