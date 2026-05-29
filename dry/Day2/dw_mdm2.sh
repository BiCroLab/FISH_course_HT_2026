#!/bin/bash
#SBATCH --job-name=deconwolf
#SBATCH --output=deconwolf.%j.log
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=50GB
#SBATCH --time=24:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=giulia.peveri@fht.org

set -euo pipefail

DIR="/group/bienko/projects/FISH_course/Mdm2_RNAFISH/Mdm2"

echo "Loading modules..."
module purge
module load deconwolf

echo "Deconwolf version:"
dw --version

mkdir -p "${DIR}/02.dw"

echo "Starting PSF generation..."

dw_bw \
    --lambda 669.000000 \
    --resxy 65.000000 \
    --resz 200.000000 \
    --NA 1.450000 \
    --ni 1.515000 \
    "${DIR}/02.dw/PSF_669.tif"

dw_bw \
    --lambda 445.000000 \
    --resxy 65.000000 \
    --resz 200.000000 \
    --NA 1.450000 \
    --ni 1.515000 \
    "${DIR}/02.dw/PSF_445.tif"

echo "PSF generation completed."
echo "Starting deconvolution..."

iter_669=100
iter_445=100

dw \
    --threads ${SLURM_CPUS_PER_TASK} \
    --iter ${iter_669} \
    "${DIR}/01.tif/630_001.tif" \
    "${DIR}/02.dw/PSF_669.tif"

dw \
    --threads ${SLURM_CPUS_PER_TASK} \
    --iter ${iter_445} \
    "${DIR}/01.tif/375_001.tif" \
    "${DIR}/02.dw/PSF_445.tif"

echo "Deconvolution completed."