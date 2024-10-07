# Perivascular space Identification Nnunet for Generalaisable Usage (PINGU)
# Usage Instructions: Noot noot noot noot noot, Noot noot noot noot noot, Noot noot noot noot noot noot noot noot noot noot noot noot noot noot, Noot noot noot noot. NOOT NOOT!
#======================================


# set up python environments
conda activate PINGU_env

# Where are your input images? They must be all in 1 foolder, suffixed with _0000.nii.gz (nnUNet specifications)
data_path=/home/bsin0008/Documents/Work/Projects/ProjectPSEC_PostStrokeEpilepsyCampinas
INPUT_FOLDER=${data_path}/Data_Raw/T1

# Specify output folder
OUTPUT_FOLDER=$data_path/Data_Processed/PVS/PINGU-All
if [ ! -d $OUTPUT_FOLDER ]; then mkdir -p $OUTPUT_FOLDER; fi

# Which version of PINGU would you like to use: PINGU-All (trained on all data), PINGU-AF (trained of AFL data, best in WM), PINGU-ADNI (trained on ADNI data only, best in Basal Ganglia)
PINGU_version='PINGU-All'

if [ $PINGU_version == 'PINGU-All' ]; then
	dataset=All
elif [ $PINGU_version == 'PINGU-AF' ]; then
	dataset=AFonly
elif [ $PINGU_version == 'PINGU-ADNI' ]; then 
	dataset=ADNIonly
fi
echo dataset: $dataset
#====================================== End Options

# Other specifications
task=Task101_LabelsSpecificplusWP5FCV
weightsdir=/home/bsin0008/Documents/Work/Projects/Software/PINGU/PINGU-All


# point to nnUNet weights
export nnUNet_raw_data_base=$weightsdir/nnUNet_raw_data_base
export nnUNet_preprocessed=$weightsdir/nnUNet_preprocessed
export RESULTS_FOLDER=$weightsdir/nnUNet_trained_models

SECONDS=0 ; 
# Lets go fishing
nnUNet_predict -i $INPUT_FOLDER -o $OUTPUT_FOLDER -tr nnUNetTrainerV2 -ctr nnUNetTrainerV2CascadeFullRes -m 3d_fullres -p  nnUNetPlansv2.1_trgSp_8x8x8 -t $task
echo $SECONDS seconds
