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

    echo "bwa mem -t 4 $ref $R1 $R2 > $SAM" >> "$output"

done < "$samplefile"
