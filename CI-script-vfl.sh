#!/bin/bash

set -ex

# code checking
#python3 -m pyflakes .

# activate the fedml environment
source "$HOME/miniconda/etc/profile.d/conda.sh"
conda activate fedml

conda install pandas
conda install pympler 
conda install -c conda-forge torchinfo

wandb login ee0b5f53d949c84cee7decbe7a629e63fb2f8408
wandb off

assert_eq() {
  local expected="$1"
  local actual="$2"
  local msg

  if [ "$expected" == "$actual" ]; then
    return 0
  else
    echo "$expected != $actual"
    return 1
  fi
}

round() {
  printf "%.${2}f" "${1}"
}

## Prepare NUS WIDE dataset
#cd ./fedml_api/data_preprocessing/NUS_WIDE
#python3 nus_wide_dataset.py
#cd ../../../fedml_experiments/standalone/classical_vertical_fl

cd ./fedml_experiments/standalone/classical_vertical_fl


if [ ! -d "./logs" ] 
then
    mkdir logs
fi

## Lending club load - two party
#python3 run_vfl_fc_two_party_lending_club.py > ./logs/vfl_two_party_lending_club_logs.txt 2>&1
## Lending club loan - three party
#python3 run_vfl_fc_three_party_lending_club.py > ./logs/vfl_three_party_lending_club_logs.txt 2>&1
## NUS WIDE - two party
#python3 run_vfl_fc_two_party_nus_wide.py > ./logs/vfl_two_party_nus_wide_logs.txt 2>&1
## NUS WIDE - three party
python3 run_vfl_fc_three_party_nus_wide.py > ./logs/vfl_three_party_nus_wide_logs.txt 2>&1