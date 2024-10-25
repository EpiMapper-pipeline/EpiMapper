=============
Installation
=============


.. contents::
    :local:


Download
=========

Epimapper is written in Python and can be installed and accessed via the command line. It is available for both Linux and macOS.
The package can be downloaded from the  `EpiMapper GitHub page <https://github.com/EpiMapper-pipeline/EpiMapper>`_.

Installation
===============

It is highly recommended to create a separate virtual environment for the package to avoid any library conflicts.
We recommend installing and using Miniconda/Anaconda (`Miniconda <https://docs.conda.io/en/latest/miniconda.html>`_). Refer to the `the Conda website <https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>`_.

Before the installation, you can need to add the channels to your .condarc configuration file:

.. code-block:: yaml

   channels:
   - defaults
   - bioconda
   - anaconda
   - conda-forge

You can use the following command to add the channels:

.. code-block:: bash 

   $ conda config --add channels defaults
   $ conda config --add channels bioconda
   $ conda config --add channels conda-forge
   $ conda config --add channels anaconda

If Miniconda is already installed, you can proceed with the following step-by-step installation. 

1. Remove Previous Environment
-------------------------------

Before creating the new environment, remove the old one if it exists:

.. code-block:: bash

   # Using mamba
   $ mamba remove -n epimapper_mc --all --yes

   # Using conda
   $ conda remove -n epimapper_mc --all --yes

2. Clean Up Old Files
-------------------------
Clean up old packages and caches:

.. code-block:: bash

   # Using mamba
   $ mamba clean --all --yes

   # Using conda
   $ conda clean --all --yes

3. Set Up New Environment
-------------------------------
You can create the environment using a ``.yml`` file or a ``requirements.txt`` file.

Option 1: Use the ``.yml`` File 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
A YML (YAML) file is used to specify the configuration of an environment, including packages, dependencies, and channels. The YAML file for EpiMapper is as follows:

.. code-block:: yaml

   name: epimapper_mc
   channels:
   - defaults
   - bioconda
   - anaconda
   - conda-forge
   dependencies:
   - bowtie2=2.5.4
   - cutadapt=4.9
   - deeptools=3.5.1
   - bedtools=2.31.1
   - fastqc=0.12.1
   - macs2=2.2.7.1
   - matplotlib=3.8.4
   - numpy=1.23.0
   - openjdk=22.0.1
   - pandas=1.4.4
   - pathlib=1.0.1
   - picard=3.1.1
   - pip=24.2
   - plotly=5.24.1
   - plotnine=0.10.1
   - python=3.9.19
   - samtools=1.21
   - scikit-learn=1.5.0
   - scipy=1.9.1
   - seaborn=0.13.0
   - setuptools=75.1.0
   - mizani=0.9.2

You can use the following command to create the environment:

.. code-block:: bash

   # Using mamba
   $ mamba env create -f environment.yml --name epimapper_mc

   # Using conda
   $ conda env create -f environment.yml --name epimapper_mc

Option 2: Use ``requirements.txt``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Alternatively, you can create the environment first and then install dependencies using requirements.txt which only contains the list of dependencies:

.. code-block:: bash

   # 1. Create the environment:
   $ conda create --name epimapper_mc --yes

   # 2. Activate the environment:
   $ conda activate epimapper_mc

   # 3. Install the packages from requirements.txt:
   ## Using mamba
   $ mamba install --insecure --yes --file requirements.txt
   ## Using conda
   $ conda install --yes --file requirements.txt

Option 3: Manual Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If the above methods fail, you can install the packages manually. Be sure to clean old packages and create the environment as mentioned above.

.. code-block:: bash
   
   # Remove old environment and clean up
   $ remove -n epimapper_mc --all
   $ clean --all --yes

   # Create the environment
   $ create -n epimapper_mc python=3.9.19 --yes
   $ activate epimapper_mc

   # Install required packages
   $ install samtools=1.6 deeptools=3.5.1 bedtools=2.31.1 --yes
   $ install seaborn=0.13.0 setuptools=69.5.1 argparse pandas=1.4.4 numpy=1.23.0 matplotlib=3.8.4 --yes
   $ install plotnine=0.10.1 scipy=1.9.1 pathlib=1.0.1 scikit-learn=1.5.0 openjdk=22.0.1 --yes
   $ install fastqc=0.12.1 MACS2=2.2.7.1 cutadapt picard=3.1.1 bowtie2=2.2.5 --yes


Package Setup
=====================
Once the environment is ready, navigate to the ``code`` directory (folder containing setup.py) and run the following command:

.. code-block:: bash

   # Recommended installation method:
   $ install -m pip install .

   # Alternatively:
   $ python setup.py install

After this you should be ready to use EpiMapper Python package. You may try to see if everything is ready by running the following command:

.. code-block:: bash

   $ epimapper -h

The output should be something like this:

.. code-block:: bash

   usage: epimapper <task> [<args>]

   Tasks available for using:

   fastqc                      Quality control for raw reads in fastq files

   bowtie2_alignment           Alignment of fastq files to a reference genome

   remove_duplicates           Removes duplicated reads

   fragment_length             Finds and plots fragment lengths in sam files

   filtering                   Filters and converts files from bam to bed

   spike_in_calibration        Spike in normalizes input files

   peak_calling                Calls for enriched regiones in bed files

   heatmap                     Plots heatmaps of enriched regions

   differential_analysis       Preforms differential analysis on input bed files

   Python Package for analysing epigenetic data such as ChIP-seq, CUT&RUN, ATAC-seq and CUT&Tag

   positional arguments:
   task        Pipeline task to run

   optional arguments:
   -h, --help  show this help message and exit


Run Demos
=============
There are currently two demos avalible for using the EpiMapper Python package, one for CUT&Tag data and one for ATAC-seq data.
Demo data can be found in the `demos <https://github.com/EpiMapper-pipeline/EpiMapper/tree/main/demos>`_ folder. For more details, refer to the `demo.md <https://github.com/EpiMapper-pipeline/EpiMapper/blob/main/demos/demo.md>`_.
Ensure that you create the output folder before running the demos.

.. code-block:: bash

   # Navigate to the demo directory:
   $ cd ../demos/demo_histone/ 

   # Run the demo script:
   $ ./demo_histone.sh 

   # Navigate to the demo directory for ATAC-seq data:
   $ cd ../demos/demo_atac/ 

   # Run the demo script:
   $ ./demo_atac.sh
