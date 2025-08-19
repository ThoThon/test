#!/bin/bash
set -e


# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build apk --release --flavor prod --target lib/main_prod.dart

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-prod-release.apk'  \
    --app 1:944038103145:android:d4b9b96b1d0e35bb1d7af8  \
    --release-notes-file "$note_file" \
    --groups "android-testers"

echo '-------------------'
echo 'Build Android done'