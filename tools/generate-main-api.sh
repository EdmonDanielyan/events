#!/usr/bin/env bash
url=./specification.yaml
dir=../main_api_client
config=main-api-generator-config.yaml

mkdir -p $dir
java -jar openapi-generator-cli.jar generate -i $url -g dart-dio -o $dir -c $config --skip-validate-spec --global-property apiTests=false,modelTests=false

pushd
cd $dir
flutter clean
dart pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter format $dir
popd