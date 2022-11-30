#!/bin/bash -e

for file in *.csv; do
    cat $file | python2 ./mapper.py >> mapped.txt
done
cat mapped.txt | sort > sorted.txt
cat sorted.txt | python2 ./reducer.py >> reduced.txt
