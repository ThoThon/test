#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --flavor prodsds --target lib/main_prod_sds.dart --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/vBHXH.ipa' \
    --app 1:1048213822229:ios:6b741a6ec851a1bf7d671c \
    --release-notes-file "$note_file" \
    --groups "ios-testers"

echo '-------------------'
echo 'Build IOS done'