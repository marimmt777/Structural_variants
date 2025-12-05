########################################################
##...create alignment command lines for all samples...##
########################################################

#!/bin/bash

ref="/area/DBV/LAB-EEGP/Genomes/PITSTA_inv_final.fasta"

samplefile="samples.txt"
output="commands_alignment.txt"

# limpa arquivo de saída
> "$output"

while IFS= read -r sample; do
    
    R1="${sample}_1.fastq.gz"
    R2="${sample}_2.fastq.gz"
    SAM="${sample}.sam"

    # Verifica se os arquivos existem
    if [[ -f "$R1" && -f "$R2" ]]; then
        echo "bwa mem -t 4 $ref $R1 $R2 > $SAM" >> "$output"
    else
        echo "AVISO: faltando R1 ou R2 para $sample" >&2
    fi

done < "$samplefile"

