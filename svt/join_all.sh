#!/usr/bin/env bash
echo "time,user,test_case,operation,operation_time,channels,used_channels,error_message" > joined_data.csv

find . -name 'output_*.csv' -exec tail -n +2 {} \; >> joined_data.csv

rm -rf output_*.csv