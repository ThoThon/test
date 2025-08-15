#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'uat' or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=vbhxh-dev \
      --out=lib/firebase_options_dev.dart \
      --ios-bundle-id=com.viettel.ttcntt.vbhxh.dev \
      --ios-out=ios/flavors/dev/GoogleService-Info.plist \
      --android-package-name=com.viettel.ttcntt.vbhxh.dev \
      --android-out=android/app/src/dev/google-services.json
    ;;
  uat)
    flutterfire config \
      --project=vbhxh-uat \
      --out=lib/firebase_options_uat.dart \
      --ios-bundle-id=com.viettel.ttcntt.vbhxh.uat \
      --ios-out=ios/flavors/uat/GoogleService-Info.plist \
      --android-package-name=com.viettel.ttcntt.vbhxh.uat \
      --android-out=android/app/src/uat/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=vbhxh-prod \
      --out=lib/firebase_options_prod.dart \
      --ios-bundle-id=com.viettel.ttcntt.vbhxh \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=com.viettel.ttcntt.vbhxh \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'uat' or 'prod'."
    exit 1
    ;;
esac