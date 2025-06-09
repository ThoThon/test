#!/bin/bash
set -e


# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build apk lib/main.dart --release

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-release.apk'  \
    --app 1:457157614636:android:b3a1a1a668557ac3318589  \
    --release-notes-file "$note_file" \
    --groups "sds-android"

echo '-------------------'
echo 'Build Android done'