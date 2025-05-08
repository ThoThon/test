#!/bin/bash
set -e


# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

flutter build apk lib/main.dart --release

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-release.apk'  \
    --app 1:845870308776:android:e7ad9e4e2ef7287ef0919d  \
    --release-notes-file "$note_file" \
    --groups "SDS Android"

echo '-------------------'
echo 'Build Android done'