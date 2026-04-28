#!/bin/bash
#SBATCH -A UPPMAX2026-1-61
#SBATCH --reservation=uppmax2026-1-61_6
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 24:00:00
#SBATCH -J BRAKER3_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user edith.nilsson.0914@student.uu.se
#SBATCH --output=/home/edni0914/Genome-Analysis-Project/output/04_annotation/%x.%j.out
#SBATCH --error=/home/edni0914/Genome-Analysis-Project/error/04_annotation/%x.%j.err



#load module
module load SeqKit/2.10.1
module load SAMtools/1.22.1-GCC-13.3.0


WORKINGDIR=/home/edni0914/Genome-Analysis-Project/results/04_annotation/braker3

#cleaning files
seqkit seq -m 10000 /home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble.fasta.masked > /home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble_min_10000.fasta.masked
Home=/home/edni0914

export AUGUSTUS_CONFIG_PATH=/home/edni0914/bin/braker3 
export TMPDIR=/home/edni0914/Genome-Analysis-Project/temp_braker_${SLURM_JOB_ID} 
# -B /home/edni0914/augustus_config:/augustus_config \
singularity exec \
 -B $Home:$Home \
 -B $AUGUSTUS_CONFIG_PATH:/augustus_config \
 /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif \
 braker.pl \
    --genome=/home/edni0914/Genome-Analysis-Project/results/04_annotation/repeatmasker/pilon_polished_assemble_min_10000.fasta.masked \
    --bam=/home/edni0914/Genome-Analysis-Project/results/04_annotation/mapped_rna.bam \
    --species=Niphotrichum_japonicum \
    --threads=2 \
    --workingdir=$WORKINGDIR \
    --softmasking \
    --prot_seq=/home/edni0914/Genome-Analysis-Project/C_purpureus.faa \
    --AUGUSTUS_CONFIG_PATH=/augustus_config


