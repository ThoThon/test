#!/bin/bash
set -e
python3 .build/doc2note.py
sh .build/dev/ios.sh
sh .build/dev/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
