########Before running #############################################################
#
#please clean up output folder such as in "out/"!
#If output folder (e.g., "out/") does not exist, then please create it before running the demo!
#
###############################################################################
# EpiMapper Demo run on human modification data
# 1. fastqc
echo "fastqc ... "
#create out?
epimapper fastqc -f fastq -o out

# 2. bowtie2_alignment - To reference genome Hg38
echo "alignment hg38 ...i "
#create out?
epimapper bowtie2_alignment -f fastq -i in/hg38/bowtie2_index_hg38 -o out 

# bowtie2_alignment - To spike-in genome (E.coli)
echo "alignment spike-in ... "
#creat out?
epimapper bowtie2_alignment -f fastq -s True -i in/Ecoil/bowtie2_index_ecoil -o out

# 3. remove_duplicates only works picard 3.1.1
echo "remove duplated reads ... "
#creat out?
epimapper remove_duplicates -s out/Epimapper/alignment/sam -o out

#add reads grounp in removed dupated sam files?? extrac chr1 as demo?
# 4. fragment_length
#creat out?
echo " fragment legnth ... "
epimapper fragment_length -s out/Epimapper/alignment/removeDuplicate/sam_duplicates_removed -o out

# 5. filtering 
#creat out?
echo "filtering black list regions ... "
epimapper filtering -s out/Epimapper/alignment/removeDuplicate/sam_duplicates_removed \
	-cs in/hg38/hg38.chrom.sizes.clear.sorted -bl in/hg38/blacklist.bed -sn True -o out 

# 6. spike_in_calibration
#creat out?
echo " spike in calibration ... "
epimapper spike_in_calibration -b out/Epimapper/alignment/bed -cs in/hg38/hg38.chrom.sizes.clear.sorted \
	-ss out/Epimapper/alignment/sam_spike_in -o out

# 7. peak_calling 
echo " peak calling ... "
#in small demo datasets, the control option doesnot work but use the top 0.01 instead
epimapper peak_calling  -soft seacr -f out/Epimapper/alignment/bed -bg out/Epimapper/alignment/bedgraph \
	-p 0.01 -c IgG -lb d-IgG_rep2 d-IgG_rep2 d-IgG_rep2 d-IgG_rep2 \
	-la d-H3K27me3_rep1 d-H3K27me3_rep2 d-H3K4me3_rep1 d-H3K4me3_rep2 -o out

# 8. heatmap
echo "generate heatap for called peask ... "
epimapper heatmap -b out/Epimapper/alignment/bam  -p out/Epimapper/peakCalling/seacr/top_0.01 \
	-bl in/hg38/blacklist.bed -r in/hg38/hg38.refGene_uniqGeneName.bed  -o out

# 9. differential_analysis
#creat out?
echo "differential peak analysis "
epimapper differential_analysis -p out/Epimapper/peakCalling/seacr/top_0.01 \
	-bg out/Epimapper/alignment/bedgraph \
	-bl in/hg38/blacklist.bed -r in/hg38/hg38.refFlat.txt -cs in/hg38/hg38.chrom.sizes.clear.sorted \
	-la d-H3K27me3_rep1 d-H3K27me3_rep2 -lb d-H3K4me3_rep1 d-H3K4me3_rep2 -an True \
	-n True -cut 0.0001 -e  in/hg38/hg38_all_enhancers_merged_hglft_genome_327b3_4dmr.bed -o out

