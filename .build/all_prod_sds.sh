#!/bin/bash
set -e
sh .build/prod_sds/ios.sh
sh .build/prod_sds/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
