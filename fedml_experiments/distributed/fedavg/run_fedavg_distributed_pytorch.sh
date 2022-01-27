#!/usr/bin/env bash

CLIENT_NUM=${1}
WORKER_NUM=${2}
BATCH_SIZE=${3}
DATASET=${4}
DATA_DIR=${5}
MODEL=${6}
DISTRIBUTION=${7}
ROUND=${8}
EPOCH=${9}
LR=${10}
CLIENT_OPTIMIZER=${11}
CI=${12}

PROCESS_NUM=`expr $WORKER_NUM + 1`
echo $PROCESS_NUM

#hostname > mpi_host_file

# FOR GPU
mpirun -np $PROCESS_NUM -hostfile ./mpi_host_file python3 ./main_fedavg.py \
  --model $MODEL \
  --dataset $DATASET \
  --data_dir $DATA_DIR \
  --partition_method $DISTRIBUTION  \
  --client_num_in_total $CLIENT_NUM \
  --client_num_per_round $WORKER_NUM \
  --comm_round $ROUND \
  --epochs $EPOCH \
  --client_optimizer $CLIENT_OPTIMIZER \
  --batch_size $BATCH_SIZE \
  --lr $LR \
  --ci $CI