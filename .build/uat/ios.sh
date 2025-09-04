#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --flavor uat --target lib/main_uat.dart --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/vBHXH.ipa' \
    --app 1:910531596124:ios:6afe8c11b4c83b6c5a7b99 \
    --release-notes-file "$note_file" \
    --groups "ios-testers"

echo '-------------------'
echo 'Build IOS done'