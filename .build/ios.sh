#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/vBHXH.ipa' \
    --app 1:457157614636:ios:bf268f5845dea3c3318589 \
    --release-notes-file "$note_file" \
    --groups "sds-ios"

echo '-------------------'
echo 'Build IOS done'