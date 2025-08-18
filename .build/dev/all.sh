#!/bin/bash
set -e
sh .build/dev/ios.sh
sh .build/dev/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
