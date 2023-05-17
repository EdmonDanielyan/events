#/bin/sh
env=$1
platform=$2

#### Environment values: prod, dev, all
#### Platform values: android, ios

building()
{
  build_type=$1
  environment=$2

  if [ "$environment" == "all" ]; then
    flutter build "$build_type" --release --no-sound-null-safety --flavor dev -t lib/dev_main.dart
    flutter build "$build_type" --release --no-sound-null-safety --flavor prod -t lib/prod_main.dart
  else flutter build "$build_type" --release --no-sound-null-safety --flavor "$environment" -t lib/"$environment"_main.dart
  fi

}

flutter packages pub run build_runner build --delete-conflicting-outputs

if [ "$platform" == "android" ]; then
  building apk "$env"
  building aab "$env"
elif [ "$platform" == "ios" ]; then
  building ipa "$env"
elif [ "$platform" == "all" ]; then
    building apk "$env"
    building ipa "$env"
fi
