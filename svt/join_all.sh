#!/usr/bin/env bash
rm -rf joined_data.csv
find . -name 'output_*.csv' -exec tail -n +2 {} \; >> joined_data.csv