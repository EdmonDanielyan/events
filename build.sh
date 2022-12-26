#/bin/sh
env=$1
platform=$2

#### Environment values: prod, dev
#### Platform values: android, ios

flutter clean
flutter pub upgrade
flutter packages pub run build_runner build --delete-conflicting-outputs

if [ "$platform" == "android" ]; then
  flutter build apk --release --no-sound-null-safety -t lib/"$env"_main.dart
elif [ "$platform" == "ios" ]; then
  flutter build ipa --release --no-sound-null-safety -t lib/"$env"_main.dart
fi