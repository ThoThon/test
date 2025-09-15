#!/bin/bash
set -e
python3 .build/doc2note.py
sh .build/prod_sds/ios.sh
sh .build/prod_sds/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
