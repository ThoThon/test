#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --flavor prod --target lib/main_prod.dart --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/vBHXH.ipa' \
    --app 1:944038103145:ios:7a7137dc768557161d7af8 \
    --release-notes-file "$note_file" \
    --groups "ios-testers"

echo '-------------------'
echo 'Build IOS done'