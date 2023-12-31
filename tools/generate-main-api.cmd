SetLocal EnableExtensions

set url="./specification.yaml"
set dir="../main_api_client"
set config="main-api-generator-config.yaml"

mkdir %dir%
java -jar openapi-generator-cli.jar generate -i %url% -g dart-dio -o %dir% -c %config% --skip-validate-spec --global-property apiTests=false,modelTests=false

pushd
cd %dir%
call flutter clean
call flutter pub get
call flutter pub run build_runner build --delete-conflicting-outputs
call flutter format %dir%
popd