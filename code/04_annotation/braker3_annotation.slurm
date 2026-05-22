#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 24:00:00
#SBATCH -J BRAKER3_annotation
#SBATCH --mem=94GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err



#load module
module load SeqKit/2.10.1
module load SAMtools/1.22.1-GCC-13.3.0


WORKINGDIR=/home/edni0914/Genome-Analysis-Project/results/04_annotation/braker3
Home=/home/edni0914

#cleaning files
seqkit seq -m 5000 /home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble.fasta.masked > /home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble_min_5000.fasta.masked

#setting variables
REFERENCE=/home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble_min_5000.fasta.masked
PROTEIN=/home/edni0914/Genome-Analysis-Project/C_purpureus.faa


BAM_C1=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/1_mapped_rna.bam
BAM_C2=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/2_mapped_rna.bam
BAM_C3=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/3_mapped_rna.bam
BAM_H1=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/4_mapped_rna.bam
BAM_H2=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/5_mapped_rna.bam
BAM_H3=/home/edni0914/Genome-Analysis-Project/results/05_mapping/hisat/6_mapped_rna.bam

export AUGUSTUS_CONFIG_PATH=/home/edni0914/bin/augustus_config
export TMPDIR=/home/edni0914/Genome-Analysis-Project/temp_braker_${SLURM_JOB_ID}
mkdir -p $TMPDIR 

singularity exec \
 -B $Home:$Home \
 -B $AUGUSTUS_CONFIG_PATH:/augustus_config \
 -B $TMPDIR:/tmp \
 /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif \
 braker.pl \
    --genome=$REFERENCE \
    --softmasking \
    --bam=$BAM_C1,$BAM_C2,$BAM_C3,$BAM_H1,$BAM_H2,$BAM_H3 \
    --species=Niphotrichum_japonicum_5 \
    --prot_seq=$PROTEIN \
    --threads=2 \
    --workingdir=$WORKINGDIR \
    --skipOptimize \
    --kfold=2 \
    --AUGUSTUS_CONFIG_PATH=/augustus_config