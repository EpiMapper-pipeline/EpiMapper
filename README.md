
# EpiMapper: A New Tool for Analyzing High Throughput Sequencing from CUT&Tag
## EpiMapper Documentation

EpiMapper is a complete pipeline for data analysis of epigenomic sequencing.

## Download:

Epimapper is written in Python. It can be installed and accessed from command line and is avalible for both linux and macOS. 
	

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
You can create the environment using a **.yml** file or a **requirements.txt** file.

#### 3.1. Use the .yml File 
```shell
# Using mamba
mamba env create -f environment.yml --name epimapper_mc

# Using conda
conda env create -f environment.yml --name epimapper_mc
```

#### 3.2. Create the Environment with requirements.txt
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

#### 3.3. Install all pacakages mannually
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

### 4. Install EpiMapper
Once the environment is ready, you can go to the [code](https://github.com/EpiMapper-pipeline/EpiMapper/tree/main/code) directory (folder containing setup.py) and run the following command:

```shell
# Recommended installation method:
install -m pip install .

# Alternatively:
python setup.py install
```

## Run demos:
There are currently two demos avalible for using the EpiMapper Python package, one for CUT&Tag data and one for ATAC-seq data.
Demo data can be found in the [demos](https://github.com/EpiMapper-pipeline/EpiMapper/tree/main/demos) folder. Ensure that you create the output folder before running the demos.

```shell
# Navigate to the demo directory:
cd ../demos/demo_histone/ 

# Run the demo script:
./demo_histone.sh 
```
