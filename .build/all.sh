#!/bin/bash
set -e
python3 .build/doc2note.py
sh .build/ios.sh
sh .build/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
