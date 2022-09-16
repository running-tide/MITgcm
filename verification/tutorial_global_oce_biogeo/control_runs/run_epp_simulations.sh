#!/bin/bash


for f in epp*22.txt; do

  echo "Doing ${f:0:4}"
  # be careful that modify chemistry is being 22.txt
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
