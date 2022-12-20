#/bin/sh
flutter clean
flutter pub upgrade
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter build apk --release --no-sound-null-safety
