
# EpiMapper: A New Tool for Analyzing High-Throughput Sequencing from CUT&Tag

<div align="center">
    <a href="https://www.helse-sorost.no/">
        <img src="docs/source/content/figures/helse-sor-ost.jpg" height="25"/ >
    </a>
    <a href="https://www.ahus.no/">
        <img src="docs/source/content/figures/ahhus.png" height="25" />
    </a>
    <a href="https://www.uio.no/">
        <img src="docs/source/content/figures/uio_segl_a.png"  height="25" />
    </a>
</div>


## EpiMapper Documentation

EpiMapper is a complete pipeline designed for the analysis of epigenomic sequencing data. For more information, you can refer to the [documentation](https://epimapper-pipeline.github.io/EpiMapper/)

## Download:
Epimapper is written in Python and can be installed and accessed via the command line. It is available for both Linux and macOS. You can download this pipeline from the [EpiMapper repository](https://github.com/EpiMapper-pipeline/EpiMapper).


## Installation:
It is highly recommended to create a separate virtual environment for the package to avoid any library conflicts problem. You you create virtual environment using the following commands. We recommend to use install and use [miniconda/anaconda](https://docs.conda.io/en/latest/miniconda.html). Refer to the [Conda documentation](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) for tutorials on creating and managing virtual environments. 

### 0. Add channel
Add the following channels to your .condarc configuration file:

```yaml
channels:
 - defaults
 - bioconda
 - anaconda
 - conda-forge
 ```

### 1. Remove Old Environment
Before creating the new environment, remove the old one if it exists:
```shell
# Using mamba
mamba remove -n epimapper_mc --all --yes

# Using conda
conda remove -n epimapper_mc --all --yes
```

### 2. Clean Up Old Files
Clean up old packages and caches:
```shell
# Using mamba
mamba clean --all --yes

# Using conda
conda clean --all --yes
```

### 3. Create the Environment
You can create the environment using a `.yml` file or a `requirements.txt` file.

#### Option 1: Use the .yml File 
```shell
# Using mamba
mamba env create -f environment.yml --name epimapper_mc

# Using conda
conda env create -f environment.yml --name epimapper_mc
```

#### Option 2: Use requirements.txt
Alternatively, you can create the environment first and then install dependencies using requirements.txt:

```shell
# 1. Create the environment:
conda create --name epimapper_mc --yes

# 2. Activate the environment:
conda activate epimapper_mc

# 3. Install the packages from requirements.txt:
## Using mamba
mamba install --insecure --yes --file requirements.txt
## Using conda
conda install --yes --file requirements.txt
```

#### Option 3: Manual Installation
If the above methods fail, you can install the packages manually. Be sure to clean old packages and create the environment as mentioned above.

```shell
# Remove old environment and clean up
remove -n epimapper_mc --all
clean --all --yes

# Create the environment
create -n epimapper_mc python=3.9.19 --yes
activate epimapper_mc

# Install required packages
install samtools=1.6 deeptools=3.5.1 bedtools=2.31.1 --yes
install seaborn=0.13.0 setuptools=69.5.1 argparse pandas=1.4.4 numpy=1.23.0 matplotlib=3.8.4 --yes
install plotnine=0.10.1 scipy=1.9.1 pathlib=1.0.1 scikit-learn=1.5.0 openjdk=22.0.1 --yes
install fastqc=0.12.1 MACS2=2.2.7.1 cutadapt picard=3.1.1 bowtie2=2.2.5 --yes
```

### 4. Package Setup
Once the environment is ready, you can go to the [EpiMapper](https://github.com/EpiMapper-pipeline/EpiMapper/tree/main/EpiMapper) directory (folder containing setup.py) and run the following command:

```shell
# Recommended installation method:
install -m pip install .

# Alternatively:
python setup.py install
```

## Run Demos:
There are currently two demos avalible for using the EpiMapper Python package, one for CUT&Tag data and one for ATAC-seq data.
Demo data can be found in the [demos](https://github.com/EpiMapper-pipeline/EpiMapper/tree/main/demos) folder. Ensure that you create the output folder before running the demos.

```shell
# Navigate to the demo directory for CUT&Tag data:
cd ../demos/demo_histone/ 

# Run the demo script:
./demo_histone.sh 

# Navigate to the demo directory for ATAC-seq data:
cd ../demos/demo_atac/ 

# Run the demo script:
./demo_atac.sh
```

## Pipeline Tasks:
	
The pipeline consists of follwoing tasks. To run a task, type epimapper task args. To see what are the options for each task of the pipeline, please run: epimapper -h

- `fastqc`: Performs quality control on raw FASTQ files from high-throughput sequencing.
- `bowtie2_alignment`: Maps reads to a reference genome using Bowtie2 for aligning FASTQ sequencing read files from high-throughput sequencing and visualizing results.
- `remove_duplicates`: Removes duplicated reads mapped to the same place in a reference genome during alignment and visualizes results.
- `fragment_length`: Evaluates the mapped fragment length distribution of input SAM files exported from high-throughput sequencing alignment and visualizes results.
- `filtering`: Performs data filtering for mapped reads based on their alignment quality and file format conversion before high-level data analysis, visualizing reproducibility among biological replicates.
- `spike_in_calibration`: Removes experimental bias by normalizing fragment counts based on sequencing depth to a spike-in genome and visualizes results.
- `peak_calling`: Finds enriched regions and calls peaks from chromatin profiling data with SEACR or MACS2, then visualizes results.
- `heatmap`: Visualizes the enrichment of target proteins in predefined genomic regions and peaks by creating heatmaps.
- `differential_analysis`: Performs differential analysis on enriched regions and peaks before annotating the statistically significant changes to specific genomic regions and visualizing the results.



