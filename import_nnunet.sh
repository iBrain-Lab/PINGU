# Perivascular space Identification Nnunet for Generalaisable Usage (PINGU)
# Usage Instructions: Noot noot noot noot noot, Noot noot noot noot noot, Noot noot noot noot noot noot noot noot noot noot noot noot noot noot, Noot noot noot noot. NOOT NOOT!
#======================================



conda activate PINGU_env


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
 
# specify where the weights are stored
weightsdir=""


# point to nnUNet weights
export nnUNet_raw_data_base=$weightsdir/nnUNet_raw_data_base
export nnUNet_preprocessed=$weightsdir/nnUNet_preprocessed
export RESULTS_FOLDER=$weightsdir/nnUNet_trained_models

# Lets go fishing
nnUNet_install_pretrained_model_from_zip PINGU-All_v0.zip

