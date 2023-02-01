#/bin/sh
env=$1
platform=$2

#### Environment values: prod, dev, all
#### Platform values: android, ios

flutter packages pub run build_runner build --delete-conflicting-outputs

if [ "$platform" == "android" ]; then
  if [ "$env" == "all" ]; then
    flutter build apk --release --no-sound-null-safety -t lib/dev_main.dart
    flutter build apk --release --no-sound-null-safety -t lib/prod_main.dart
  else
    flutter build apk --release --no-sound-null-safety -t lib/"$env"_main.dart
  fi
elif [ "$platform" == "ios" ]; then
  if [ "$env" == "all" ]; then
      flutter build ipa --release --no-sound-null-safety -t lib/dev_main.dart
      flutter build ipa --release --no-sound-null-safety -t lib/prod_main.dart
    else
      flutter build ipa --release --no-sound-null-safety -t lib/"$env"_main.dart
    fi
fi