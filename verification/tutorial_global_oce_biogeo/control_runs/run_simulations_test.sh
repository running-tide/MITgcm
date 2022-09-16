#!/bin/bash


for f in exp2_modify_chemistry22.txt  exp3_modify_chemistry22.txt exp4_modify_chemistry22.txt; do

  echo "Doing ${f:0:4}"
  # be careful that modify chemistry is being 22.txt
  rm -r ../run/modify_chemistry*
  cp $f ../run/modify_chemistry22.txt
  cp data* ../run
  
  cd ../run
  rm -rf mnc_test_00*
  ./mitgcmuv >& out.log
  cp modify_chemistry22.txt mnc_test_0001
  rm -r ${f:0:4}
  cp -r mnc_test_0001 ${f:0:4}
  cd ../control_runs
  
done
