#!/bin/bash

set -ex

# code checking
#python3 -m pyflakes .

# activate the fedml environment
source "$HOME/miniconda/etc/profile.d/conda.sh"
conda activate fedml

conda install pandas

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

#cd ../../../fedml_experiments/distributed/classical_vertical_fl
cd ./fedml_experiments/distributed/classical_vertical_fl


if [ ! -d "./logs" ] 
then
    mkdir logs
fi

## Lending club load
#sh run_vfl_distributed_pytorch.sh lending_club_loan > ./logs/lending_club_logs.txt 2>&1
## NUS WIDE
sh run_vfl_distributed_pytorch.sh NUS_WIDE > ./logs/nus_wide_logs.txt 2>&1