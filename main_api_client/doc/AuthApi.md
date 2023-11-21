# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**auth**](AuthApi.md#auth) | **POST** /auth/login | Авторизация
[**authLogoutPost**](AuthApi.md#authlogoutpost) | **POST** /auth/logout | Выход из профиля
[**authRefreshPost**](AuthApi.md#authrefreshpost) | **POST** /auth/refresh | Продление JWT токена по refresh token
[**authRegisterConfirmPost**](AuthApi.md#authregisterconfirmpost) | **POST** /auth/register/confirm | Подтверждение регистрации по коду из SMS
[**authRegisterPost**](AuthApi.md#authregisterpost) | **POST** /auth/register | Регистрация


# **auth**
> AuthSuccess auth(authParams)

Авторизация

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final AuthParams authParams = ; // AuthParams | Информация для авторизации

try {
    final response = api.auth(authParams);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->auth: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authParams** | [**AuthParams**](AuthParams.md)| Информация для авторизации | [optional] 

### Return type

[**AuthSuccess**](AuthSuccess.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authLogoutPost**
> RequiredSuccess authLogoutPost(logoutParams)

Выход из профиля

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final LogoutParams logoutParams = ; // LogoutParams | 

try {
    final response = api.authLogoutPost(logoutParams);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->authLogoutPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **logoutParams** | [**LogoutParams**](LogoutParams.md)|  | [optional] 

### Return type

[**RequiredSuccess**](RequiredSuccess.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRefreshPost**
> AuthSuccess authRefreshPost(refreshTokenParams)

Продление JWT токена по refresh token

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final RefreshTokenParams refreshTokenParams = ; // RefreshTokenParams | 

try {
    final response = api.authRefreshPost(refreshTokenParams);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->authRefreshPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshTokenParams** | [**RefreshTokenParams**](RefreshTokenParams.md)|  | [optional] 

### Return type

[**AuthSuccess**](AuthSuccess.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRegisterConfirmPost**
> RegisterConfirmSuccess authRegisterConfirmPost(registerConfirmParams)

Подтверждение регистрации по коду из SMS

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final RegisterConfirmParams registerConfirmParams = ; // RegisterConfirmParams | 

try {
    final response = api.authRegisterConfirmPost(registerConfirmParams);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->authRegisterConfirmPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerConfirmParams** | [**RegisterConfirmParams**](RegisterConfirmParams.md)|  | [optional] 

### Return type

[**RegisterConfirmSuccess**](RegisterConfirmSuccess.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRegisterPost**
> RegisterSuccess authRegisterPost(registerParams)

Регистрация

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final RegisterParams registerParams = ; // RegisterParams | 

try {
    final response = api.authRegisterPost(registerParams);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->authRegisterPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerParams** | [**RegisterParams**](RegisterParams.md)|  | [optional] 

### Return type

[**RegisterSuccess**](RegisterSuccess.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

