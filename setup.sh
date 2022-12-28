#!/usr/bin/env bash
#flutter pub get
#flutter packages pub run build_runner build --delete-conflicting-outputs
flutter clean
flutter build ios --no-sound-null-safety -t lib/dev_main.dart
