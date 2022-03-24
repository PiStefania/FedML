#!/bin/bash

set -ex

# activate the fedml environment
source "$HOME/miniconda/etc/profile.d/conda.sh"
conda activate fedml

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

## Go to split NN python file folder
cd ./fedml_experiments/distributed/split_nn

if [ ! -d "./logs" ] 
then
    mkdir logs
fi

# Run splitNN with default parameters and without GPU
mpirun -np 3 -hostfile ./mpi_host_file python3 ./main_split_nn.py \
  --client_number 3 \
  --gpu_server_num 1 \
  --gpu_num_per_server 1 \
  --comm_round 1 \
  --epochs 1 \
  > ./logs/split_nn_logs.txt 2>&1