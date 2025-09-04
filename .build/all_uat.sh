#!/bin/bash
set -e
sh .build/uat/ios.sh
sh .build/uat/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
