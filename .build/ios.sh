#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/v_bhxh.ipa' \
    --app 1:845870308776:ios:e1ed730ac9a82803f0919d \
    --release-notes-file "$note_file" \
    --groups "SDS Ios"

echo '-------------------'
echo 'Build IOS done'