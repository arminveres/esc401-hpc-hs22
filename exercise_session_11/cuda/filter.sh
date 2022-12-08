#!/bin/bash -e
awk 'NR <= 80 {print $10}' output-loop.log > data.dat
