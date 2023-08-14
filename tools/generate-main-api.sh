#!/usr/bin/env bash
url=./specification.yaml
dir=../main_api_client
config=main-api-generator-config.yaml

mkdir -p $dir
java -jar openapi-generator-cli.jar generate -i $url -g dart-dio -o $dir -c $config --skip-validate-spec --global-property apiTests=false,modelTests=false

cd $dir
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart format $dir
#for generate ./lib/setup.config file
cd ..
dart run build_runner build --delete-conflicting-outputs

