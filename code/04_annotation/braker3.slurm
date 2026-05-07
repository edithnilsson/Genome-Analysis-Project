#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 14:00:00
#SBATCH -J BRAKER3_annotation
#SBATCH --mem=94GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err

module load SeqKit/2.10.1
module load SAMtools/1.22.1-GCC-13.3.0

#cleaning files
seqkit seq -m 5000 /home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble.fasta.masked > /home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble_5000.fasta.masked

#setting variables
Home=/home/edni0914
PROTEIN=/home/edni0914/Genome-Analysis-Project/C_purpureus.faa
OUT=/home/edni0914/Genome-Analysis-Project/results/04_annotation/braker3

BAM_C1=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/1_mapped_rna.bam
BAM_C2=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/2_mapped_rna.bam
BAM_C3=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/3_mapped_rna.bam
BAM_H1=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/4_mapped_rna.bam
BAM_H2=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/5_mapped_rna.bam
BAM_H3=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/6_mapped_rna.bam

REF=/home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble_5000.fasta.masked

export AUGUSTUS_CONFIG_PATH="/home/edni0914/bin/augustus_config" 

singularity exec \
 -B $Home:$Home \
 --env AUGUSTUS_CONFIG_PATH="/home/edni0914/bin/augustus_config" \
 /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif \
 braker.pl \
    --threads 2 \
    --genome=$REF \
    --softmasking \
    --bam=$BAM_C1,$BAM_C2,$BAM_C3,$BAM_H1,$BAM_H2,$BAM_H3 \
    --prot_seq=$PROTEIN \
    --species=Niphotrichum_japonicum_6 \
    --workingdir=$OUT