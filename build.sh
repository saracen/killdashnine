#!/bin/bash

apt-get update
apt-get install fio
mkdir -p $TEST_DIR
df -h
fio --name=write_throughput --directory=$TEST_DIR --numjobs=2 --size=2G --time_based --runtime=60s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=1M --iodepth=64 --rw=write --group_reporting=1
fio --name=write_iops --directory=$TEST_DIR --size=2G --time_based --runtime=60s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=4K --iodepth=256 --rw=randwrite --group_reporting=1
fio --name=read_throughput --directory=$TEST_DIR --numjobs=2 --size=2G --time_based --runtime=60s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=1M --iodepth=64 --rw=read --group_reporting=1
fio --name=read_iops --directory=$TEST_DIR --size=2G --time_based --runtime=60s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=4K --iodepth=256 --rw=randread --group_reporting=1
rm $TEST_DIR/write* $TEST_DIR/read*
