
This is a version of the workflow provided by Nanopore epi2me labs at https://github.com/epi2me-labs/wf-single-cell designed specifically to work easily on Biowulf with long read input data. If you have any problems running it, consult either with Datatecnica or Biowulf.

## BEFORE RUNNING

### Table of Contents
#### [1. Pull or copy the files from this repo](#1)
#### [2. Copy or symlink fastq files to a dedicated directory](#2)
#### [3. Edit the runscript.sh](#3)
#### [4. (Optional) Edit the nextflow.config](#4)
#### [5. Run the script](#5)

<a id="1"></a>
#### Pull or copy the files from this repo.

Choose a good location on Biowulf to run this workflow. Make sure there are plenty of GB of space. You can check on the Biowulf Dashboard at hpc.nih.gov. You will need a copy of this repo for each file you wish to process. Each much be placed in a separate folder.

```
git clone this_repo
```

<a id="2"></a>
#### Copy or symlink fastq files to a dedicated directory

In each of your processing folders, create a directory to hold your fastq file or the symlink to it. 

```
mkdir fastq
cd fastq
```
Inside this directory, either make a copy of the fastq file you would like to process or a symlink to it. Creating a symlink will save space as a full copy will not be created. However, you will also have to do the optional step 4. That method has not yet been successfully carried out and may be unsuccessful. 

To create a copy:
```
cp /data/path/of/your/fastq/file.fastq.gz ./
```
Or, you can create a symlink:
```
ln -s /data/path/of/your/fastq/file.fastq.gz ./
```

<a id="3"></a>
#### Edit the runscript.sh
mkdir symlinks
The answers to amny questions related to this not answered here can be found at https://github.com/epi2me-labs/wf-single-cell.
- First, set the fastq directory. Set it to /data/firectory/containing/.fastq.gz/file/
- In general, it is best to not use a sample_sheet unless you already have one written.
- Instead of a sample sheet, use the `--kit_name`, `--kit_version`, `--expected_cells`, etc which are already in the runscript in this repo. 
- Be sure to set the ref_genome_dir appropriately given the kit that was used. If the one indicated in this version of the sample_sheet is not appropriate, the appropriate one can likely be found in the cellranger files corresponding to the kit used for this experiment.

<a id="4"></a>
#### Optional: Edit the nextflow.config

If you choose to use the symlink method, you must edit singularity.runOptions in the nextflow.config file to be "-B /data/folder/containing/everything/above/your/fastq/ to be as high above your fastq file(s) as you can. It still will likely not work the first time, so be sure to contact Biowulf for advice. 

<a id="5"></a>
#### Run the script

Cd back to the directory with the runscript.sh

```
sbatch runscript.sh
```

That's it! The output files should appear in the fastq directory between 3  and 24 hours after you initiate the workflow.

