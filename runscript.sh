#!/bin/bash

#SBATCH --time 1-10:00:00

module load nextflow
module load singularity

OUTPUT=$PWD/output
nextflow -log ${OUTPUT}/nextflow_logs/nextflow.log \
run epi2me-labs/wf-single-cell \
    -w ${OUTPUT}/workspace \
    -profile biowulf \
    -resume \
    --fastq /data/Neuro_Longread/long_read_scRNA/long_read_processing_slurm_singularity_symlinks_single_folders/symlinks/ \
    --kit_name 3prime \
    --kit_version v3 \
    --expected_cells 10000 \
    --matrix_min_genes 1 \
    --matrix_min_cells 1 \
    --matrix_max_mito 100 \
    --ref_genome_dir /fdb/cellranger/refdata-gex-GRCh38-2020-A/ \
    --out_dir ${OUTPUT} \
    --resources_mm2_max_threads=16
