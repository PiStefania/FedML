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
#sh run_fedavg_distributed_pytorch.sh 2 2 10 mnist ./../../../data/mnist lr hetero 200 1 0.03 sgd 0 > ./logs/fedavg_distributed_mnist_logs.txt 2>&1
## shakespeare (LEAF)
#sh run_fedavg_distributed_pytorch.sh 2 2 4 shakespeare ./../../../data/shakespeare rnn hetero 1 1 0.8 sgd 0 > ./logs/fedavg_distributed_shakespeare_logs.txt 2>&1
# fed_shakespeare (Google)
#sh run_fedavg_distributed_pytorch.sh 2 2 10 fed_shakespeare ./../../../data/fed_shakespeare/datasets rnn hetero 1 1 0.8 sgd 0 > ./logs/fedavg_distributed_fed_shakespeare_logs.txt 2>&1
## Federated EMNIST 
#sh run_fedavg_distributed_pytorch.sh 2 2 20 femnist ./../../../data/FederatedEMNIST/datasets cnn hetero 2 1 0.03 sgd 0 > ./logs/fedavg_distributed_fed_emnist_logs.txt 2>&1
## Fed_CIFAR100
#sh run_fedavg_distributed_pytorch.sh 2 2 10 fed_cifar100 ./../../../data/fed_cifar100/datasets resnet18_gn hetero 1000 1 0.1 sgd 0 > ./logs/fedavg_distributed_cifar100_logs.txt 2>&1
# Stackoverflow_LR
#sh run_fedavg_distributed_pytorch.sh 2 2 4 stackoverflow_lr ./../../../data/stackoverflow/datasets lr hetero 1 1 0.03 sgd 0 > ./logs/fedavg_distributed_stackoverflow_lr_logs.txt 2>&1
# https://wandb.ai/automl/fedml/runs/3aponqml
# Stackoverflow_NWP
#sh run_fedavg_distributed_pytorch.sh 10 10 10 stackoverflow_nwp ./../../../data/stackoverflow/datasets rnn hetero 2000 1 0.03 sgd 0 > ./logs/fedavg_distributed_stackoverflow_nwp_logs.txt 2>&1
# CIFAR10
sh run_fedavg_distributed_pytorch.sh 2 2 10 cifar10 ./../../../data/cifar10 resnet56 hetero 2 1 0.03 sgd 0 > ./logs/fedavg_distributed_cifar10_logs.txt 2>&1