#!/bin/bash
set -e
sh .build/prod/ios.sh
sh .build/prod/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
