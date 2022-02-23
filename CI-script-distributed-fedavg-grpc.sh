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
sh run_fedavg_grpc.sh 0 mnist ./../../../data/mnist hetero lr 50 2 32 0.01 adam > ./logs/fedavg_distributed_mnist_logs_grpc_0.txt 2>&1
sh run_fedavg_grpc.sh 0 femnist ./../../../data/FederatedEMNIST/datasets hetero cnn 50 2 20 0.03 sgd > ./logs/fedavg_distributed_femnist_logs_grpc_0.txt 2>&1