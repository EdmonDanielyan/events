#!/usr/bin/env bash
url="https://cloud.jetrabbits.com/main/rest/v1/openapi.json"
dir="../cloud_api_client"
config="cloud-api-generator-config.yaml"

mkdir -p $dir
java -jar openapi-generator-cli.jar generate -i $url -g dart-dio -o $dir -c $config --skip-validate-spec --global-property apiTests=false,modelTests=false

pushd
cd $dir
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter format $dir
popd