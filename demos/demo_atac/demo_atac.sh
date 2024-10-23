########Before running #############################################################
#
#please clean up output folder such as in "out/"!
#If output folder (e.g., "out/") does not exist, then please create it before running the demo!
#
###############################################################################
# EpiMapper demo run on human ATAC-seq data with randomly selected subset of reads
echo "fastqc ... "
# 1. fastqc
epimapper fastqc -f fastq -o out

echo "alignment ... "
# 2. bowtie2_alignment 
epimapper bowtie2_alignment -f fastq -i in/hg38/bowtie2_index_hg38 -o out

echo "remove duplicates ... "
# 3. remove_duplicates
epimapper remove_duplicates -s out/Epimapper/alignment/sam -o out

echo "fragment length ... "
# 4. fragment_length
epimapper fragment_length -s out/Epimapper/alignment/removeDuplicate/sam_duplicates_removed -o out

echo "filtering ... "
# 5. filtering 
epimapper filtering -s out/Epimapper/alignment/removeDuplicate/sam_duplicates_removed \
	-cs in/hg38/hg38.chrom.sizes.clear.sorted -bl in/hg38/blacklist.bed -atac True -o out

echo "peak calling ... "
# 6. peak_calling  
epimapper peak_calling -soft macs2 -f out/Epimapper/alignment/bed -b out/Epimapper/alignment/bam \
	-qval 0.1 -gs hs  -o out

echo "heatmaps ..."
# 7. heatmaps
epimapper heatmap -b out/Epimapper/alignment/bam -bl in/hg38/blacklist.bed \
	-p out/Epimapper/peakCalling/macs2/top_peaks -r in/hg38/hg38.refGene_uniqGeneName.bed -o out

echo "differential peaks ..."
#8. differntial_analysis  ??
#here names of list a and list b shall be the same as the beginning of input file names, where it is 
#the sample name
epimapper differential_analysis -p out/Epimapper/peakCalling/macs2/top_peaks \
	-r in/hg38/hg38.refFlat.txt  -bl in/hg38/blacklist.bed -cs in/hg38/hg38.chrom.sizes.clear.sorted \
	-fold True -an True -e in/hg38/hg38_all_enhancers_merged_hglft_genome_327b3_4dmr.bed \
	-la sub-diabetic_rep1 sub-diabetic_rep3  \
	-n True -cut 0.001 -lb sub-healthy_rep1 sub-healthy_rep3 -o out 

