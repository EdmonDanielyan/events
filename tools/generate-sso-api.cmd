SetLocal EnableExtensions
set url="https://dev.social-hc.app/sso/rest/v1/openapi.json"
set dir="../sso_api_client"
set config="sso-api-generator-config.yaml"

mkdir %dir%

java -jar openapi-generator-cli.jar generate -i %url% -g dart-dio -o %dir% -c %config% --skip-validate-spec --global-property apiTests=false,modelTests=false


pushd
cd %dir%
call flutter clean
call flutter pub get
call flutter pub run build_runner build --delete-conflicting-outputs
call flutter format %dir%
popd