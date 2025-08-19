#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build apk --release --flavor uat --target lib/main_uat.dart

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-uat-release.apk'  \
    --app 1:910531596124:android:01bf37928cfa1f5c5a7b99  \
    --release-notes-file "$note_file" \
    --groups "android-testers"

echo '-------------------'
echo 'Build Android done'