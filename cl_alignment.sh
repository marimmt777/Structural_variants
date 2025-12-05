########################################################
##...create alignment command lines for all samples...##
########################################################

#!/bin/bash

ref="/area/DBV/LAB-EEGP/Genomes/PITSTA_inv_final.fasta"
input="samples.txt"
output="commands_alignment.txt"

> "$output"

# Cria uma lista única de prefixos das amostras (sem _1/_2)
prefixes=$(sed 's/_1\.fastq\.gz//' "$input" | sed 's/_2\.fastq\.gz//' | sort -u)

for p in $prefixes; do

    R1="${p}_1.fastq.gz"
    R2="${p}_2.fastq.gz"
    SAM="${p}.sam"

    # Gera comando só se os dois pares existirem
    if [[ -f "$R1" && -f "$R2" ]]; then
        echo "bwa mem -t 4 $ref $R1 $R2 > $SAM" >> "$output"
    else
        echo "AVISO: par ausente para $p" >&2
    fi
done
