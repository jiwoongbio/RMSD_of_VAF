## Description

This folder contains a script that can be used to calculate the root-mean-square deviation (RMSD) of variant-allele frequencies between two samples.

For further questions please contact [@jiwoongbio](https://github.com/jiwoongbio).


## Requirements

1. Perl - https://www.perl.org
2. SAMtools - http://samtools.sourceforge.net or http://www.htslib.org
3. R - http://www.r-project.org


## Example commands

```
# Generate a pileup file from multiple BAM files
samtools mpileup -q 1 -f reference.fasta normal.bam tumor1.bam tumor2.bam | gzip > samples.pileup.gz

# Calculate RMSD values from a pileup file
perl pileup.rmsd.vaf.pl -d 10 samples.pileup.gz > rmsd.txt

# Generate various plots using RMSD values
Rscript rmsd.plots.R rmsd.txt output normal tumor1 tumor2 reference
```


## Citation

A novel TP53-KPNA3 translocation defines a de novo treatment-resistant clone in osteosarcoma.
Cold Spring Harbor molecular case studies. 2016 Sep;2(5):a000992.
http://molecularcasestudies.cshlp.org/content/2/5/a000992.full
