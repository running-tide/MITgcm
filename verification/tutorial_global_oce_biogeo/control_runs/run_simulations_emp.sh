#!/bin/bash


for f in emp2*21.txt; do

  echo "Doing ${f:0:4}"
  # delete all possible chemisty data
  rm -r ../run/modify_chemistry*
  cp $f ../run/modify_chemistry21.txt
  cp data* ../run
  
  cd ../run
  rm -rf mnc_test_00*
  ./mitgcmuv >& out.log
  cp modify_chemistry21.txt mnc_test_0001
  rm -r ${f:0:4}
  cp -r mnc_test_0001 ${f:0:4}
  cd ../control_runs
  
done
