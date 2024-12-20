
INFO: All the steps as described below must be run separately.

INSTALLING DEPENDENCIES/REQUIREMENTS:
The requirements can be found in requirements.txt.

INSTALLING THE COMMAND LINE APPLICATION:
Go the the EpiMapper directory and type:
python setup.py install


NAMING INFO:

* All input FASTQ files must follow a naming protocol, this is to ensure smooth transitions between the pipeline´s functions. The naming protocol is as follows:

	[SAMPEL-NAME]_rep[REPLICATION-NUMBER]_[R1/R2]_[(TECHNICAL-REPLICATE)].fastq

	The sample name section must not contain underscore “_” or dot “.” in the name.

	If there are no technical replicates, skip the number.
	
	Examples:
	
		H4K3me3_rep1_R2.fastq

		ZNF143-Control-48h_rep1_R1.fastq

		IgG_rep1_R2_001.fastq

		Control-sample_rep2_R2.fastq

USAGE: 

> epimapper -h
usage: epimapper <task> [<args>]

Tasks available for usage:

	fastqc 			Performs quality control on raw reads fastq files
				from high-throughput sequencing.

	bowtie2_alignment 	Mapping reads to a reference genome with Bowtie2
 				alignment of fastq sequencing reads files from
 				high-throughput sequencing, and visualizing results.

	remove_duplicates 	Remove duplicated reads mapped to the same place
				in of a reference genome during alignment,
				and visualizing results.

	fragment_length		Evaluation of mapped fragment length distribution
				of input SAM files exported from high-throughput 
				sequencing alignment, and visualizing results.

	spike_in_calibration 	Removes experimental bias by normalizing fragment 
				counts based on sequencing depth to a spike-in genome
				and visualizing results.

	peak_calling 		Finds enriched regions/calls for peaks from chromatin
				profiling data with SEACR or MACS2, then visualizing results.

	heatmap 		Visualizes the enrichment of target protein in predefined
				genomic regions and peaks by creating heatmaps.

	differential_analysis 	Performs differential analysis on enriched regions/peaks
				before annotating the statistically significant changes 
				to specific genomic regions and visualize the results.


EpiMapper

positional arguments:
  task        Pipeline task to run

optional arguments:
  -h, --help  show this help message and exit


Pipeline tasks:
To see what the options for each task of the pipeline are, please run: epimapper <task> -h


1. fastqc
Input files:
	* FASTQ files

Output:
	* HTML quality report for each FASTQ file
	* Zip folder of contents for HTML quality report

2. bowtie2_alignment
Input files:
	* FASTQ files
	* Bowtie2 indexing files or FASTA format reference genome file

Output:
	* SAM files
	* Alignment summary txt files
	* Alignment summary csv file containing all samples
	* Alignment summary plot containing all samples

3. remove_duplicates
Input files:
	* SAM files

Output files:
	* Duplicate removed SAM files
	* Picard summary txt files
	* Duplication removal summary csv file 
	* Duplication removal summary plot 


4. filtering
Input files:
	* SAM files
	* Sorted chromosome sizes txt file
	* Genome blacklist BED format file

Output files:
	* BAM files (sorted, mapped) 
	* BED files (sorted, fragments information only, blacklist filtered 500 bp bin)
	* BedGraph files
	* Reproducibility csv summary file
	* Reproducibility correlation heatmap plots (count filtered and not)

5. spike_in_calibration
Input files:
	* BED files
	* SAM files aligned to spike-in genome
	* Sorted chromosome sizes txt file

Output files:
	* Spike-in normalized BedGraph files
	* Spike-in normalization summary report csv file
	* Spike-in normalization summary plots

6. peak_calling
Input files:
	* BAM or BedGraph files
	* BED files with fragment information 

Output files:
	* BED files with called peaks
	* Peak calling summary csv file
	* Peak calling summary plots

7. heatmaps
Input files:
	* BAM files
	* BED peaks files
	* Genome blacklist BED format file
	* Reference genome RefFlat txt file

Output files:
	* Various count matrixes used for heatmap creation
	* Heatmaps of peaks located around genes
	* Heatmaps for fragments located around peaks

	
8. differntial_analysis
Input files:
	* BED files with called peaks
	* Sorted chromosome sizes txt file
	* Genome blacklist BED format file
	* Reference genome RefFlat txt file
	* BedGraph files

Output files:
	* Differential peaks files
	* Annotated differential peak files
	* Genomic region files (5dist, gene, transcription start site, 
	  transcription end site)
	* Differential peaks pie plot
	* 3D PCA plot
	* Differential peaks up/down enrichment plot



	


