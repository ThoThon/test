#!/bin/bash
set -e
python3 .build/doc2note.py
sh .build/prod/ios.sh
sh .build/prod/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
