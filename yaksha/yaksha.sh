#!/usr/bin/env bash
################################################################################
# FILE       : yaksha.sh
# DESCRIPTION: Bash script to run julia jobs. 
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/BIO
# SOURCE     : http://github.com/devya
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/devya/blob/master/LICENSE.md
# DATES      : Created:2017mar22 - Updated:2019feb12
################################################################################

./julia/bin/julia  devya/yaksha/yaksha.jl

retval=$?

if [ $retval -ne 0 ]; then
  echo "Julia script failed with $retval"
  exit $retval
fi


