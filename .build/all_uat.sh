#!/bin/bash
set -e
python3 .build/doc2note.py
sh .build/uat/ios.sh
sh .build/uat/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
