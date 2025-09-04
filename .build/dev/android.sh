#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build apk --release --flavor dev --target lib/main_dev.dart

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-dev-release.apk'  \
    --app 1:763239300866:android:a7feead7f6cb87811c0c1b  \
    --release-notes-file "$note_file" \
    --groups "android-testers"

echo '-------------------'
echo 'Build Android done'