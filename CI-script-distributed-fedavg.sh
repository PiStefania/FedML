#!/bin/bash

set -ex

# code checking
#pyflakes .

# activate the fedml environment
source "$HOME/miniconda/etc/profile.d/conda.sh"
conda activate fedml

wandb login ee0b5f53d949c84cee7decbe7a629e63fb2f8408
wandb off

cd ./fedml_experiments/distributed/fedavg

if [ ! -d "./logs" ] 
then
    mkdir logs
fi

## Run MNIST with multiple processes
sh run_fedavg_distributed_pytorch.sh 1000 3 lr hetero 200 1 4 0.03 mnist "./../../../data/mnist" sgd 0 > ./logs/fedavg_distributed_mnist_logs.txt 2>&1