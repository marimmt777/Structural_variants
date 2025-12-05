# Structural_variants
Unicamp server
**Short-reads**
--------------------------
**1.Alingment**

*a. Index the genome*

```
conda activate BWA

bwa-mem2 index PITSTA_inv_final.fasta
```

*b. Run alingment*

```
cat samples.txt | parallel -j 10 'bwa-mem2 mem -t 6 /area/DBV/LAB-EEGP/Genomes/PITSTA_inv_final.fasta /area/DBV/LAB-EEGP/Clarisse_Palma/P_staminea_albiflos/Download100823_Marilia_WGS/HN00198661/{.}_1.fastq.gz /area/DBV/LAB-EEGP/Clarisse_Palma/P_staminea_albiflos/Download100823_Marilia_WGS/HN00198661/{.}_2.fastq.gz > {.}.sam' | samtools sort -o {1}.bam
```

**2.Add @RG**

**3.Run manta**
```
ls *bam | parallel -j 1 'mkdir ./manta_out/{.}
ls *bam | parallel -j 1 'configManta.py --bam {} --referenceFasta /area/DBV/LAB-EEGP/Genomes/PITSTA_inv_final.fasta --runDir manta_out/{.}'


POPULATION
-------------------------------------------------

gVCF 


GNexux - prestar atenção nos parâmetros de filtragem dependendo do software que vai usar

merge gVCFs
/ DRAGONS

genotyping:

cada location 

single sample calling (manta, snifles...)- merging (tools) - 
regenotiping: ve o catalago do merging, volta para o bam file e ve se as variantes existem ou não no bamfile.

sniffless - pode merge


Para varias variantes, você não sabe se elas co-ocorrem 

<img width="1234" height="619" alt="image" src="https://github.com/user-attachments/assets/27cb0403-4772-4151-8558-28a8c6bbf494" /> 


Delly, snfless
collapse 3 callers - Kanpig - garantir que a genotipagem está correta


merge with sneffles e genotipar com kanpig


Validation methods

combinação de SVs com metilação
metilação como proxy para diferenciação nos tecidos





