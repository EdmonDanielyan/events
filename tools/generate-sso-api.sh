#!/usr/bin/env bash
url="https://dev.social-hc.app/sso/rest/v1/openapi.json"
dir="../sso_api_client"
config="sso-api-generator-config.yaml"

mkdir -p $dir
java -jar openapi-generator-cli.jar generate -i $url -g dart-dio -o $dir -c $config --skip-validate-spec --global-property apiTests=false,modelTests=false

pushd
cd $dir
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter format $dir
popd