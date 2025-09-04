#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

# fvm flutter build apk --release --flavor prodsds --target lib/main_prod_sds.dart

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-prodsds-release.apk'  \
    --app 1:1048213822229:android:e23e7b76ae892dd47d671c  \
    --release-notes-file "$note_file" \
    --groups "android-testers"

echo '-------------------'
echo 'Build Android done'