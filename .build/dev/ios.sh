#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --flavor dev --target lib/main_dev.dart --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/vBHXH.ipa' \
    --app 1:763239300866:ios:7b841ef0cd9c88aa1c0c1b \
    --release-notes-file "$note_file" \
    --groups "ios-testers"

echo '-------------------'
echo 'Build IOS done'