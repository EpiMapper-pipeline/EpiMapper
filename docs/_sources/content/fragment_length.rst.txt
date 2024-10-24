=================
fragment_length
=================

.. contents::
    :local:

Evaluation of mapped fragment length distribution of input SAM files exported from high-thoughput sequencing alignment, and visulizing results. 
Regarding visualizing the data, smoothed lineplot with 95% confidence intervals is provided and can be obtained by setting the **se_method** and **local_pct** parameters.

Arguments
==========

**Required arguments:**

- ``-s, -sam``: Input file folder of SAM files exported from alignment for fragment length evaluation.

**Optional arguments:**

- ``-o, out_dir``: Output directory, default = current working directory.

- ``-sm, se_method``: Select the method for calculating the standard error when computing confidence intervals: 0: Use raw data without smoothing, 1: Use local standard error based on neighboring data points, 2: Use global standard error based on the entire dataset. Default value is 2.

- ``-lp, local_pct``: Specify the percentage of local data points to consider when calculating the local standard error. This value determines the window size around each data point used to compute the local mean and standard deviation. Default is 0.05, meaning 5% of the total data points.

Example Usage
==============

Example of ploting global smoothed fragment length distribution with confidence intervals 

.. code-block:: bash

    $ epimapper fragment_length -s /Users/me/results/Epimapper/alignment/removeDuplicate/sam_duplicates_removed  -o /Users/me/results

Example of ploting locally smoothed fragment length distribution with confidence intervals

.. code-block:: bash

    $ epimapper fragment_length -s /Users/me/results/Epimapper/alignment/removeDuplicate/sam_duplicates_removed -se 1 -o /Users/me/results

Example of ploting the original fragment length distribution without confidence intervals

.. code-block:: bash

    $ epimapper fragment_length -s /Users/me/results/Epimapper/alignment/removeDuplicate/sam_duplicates_removed -se 0 -o /Users/me/results


Output
=======

Like all the other functions in EpiMapper Python package, the function will create a main ``Epimapper`` output directiry, if it is not already present in the chosen output directory. The function will also create one additional folder, which will contain the output. 
Here, each sample´s fragments lengths will be represented by one text file, which are combined into one CSV file (Fragment_length_all_samples.csv). This CSV file will be used to create two PNG files each containing a plot, one violon plot and one line plot.

.. code-block:: bash

    Epimapper
        |- FragmentLength
        |   |- "sample-name"_fragmentLen.txt
        |   |- Fragment_length_all_samples.csv
        |- summary_tables
        |   |- Fragment_length_violin.png
        |   |- Fragment_length_lineplot.png


