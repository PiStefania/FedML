#!/bin/bash

set -ex

# activate the fedml environment
source "$HOME/miniconda/etc/profile.d/conda.sh"
conda activate fedml

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

## Go to split NN python file folder
cd ./fedml_experiments/distributed/split_nn

if [ ! -d "./logs" ] 
then
    mkdir logs
fi

# Run splitNN with default parameters and without GPU
python3 main_split_nn.py --gpu_server_num 0 --gpu_num_per_server 0 > ./logs/split_nn_logs.txt 2>&1