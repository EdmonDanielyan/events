# main_api_client.api.AuthApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://test.ink.vpool.qsoft.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**auth**](AuthApi.md#auth) | **post** /auth/login | Авторизация
[**authRefreshPost**](AuthApi.md#authRefreshPost) | **post** /auth/refresh | Продление JWT токена по refresh token
[**authRegisterConfirmPost**](AuthApi.md#authRegisterConfirmPost) | **post** /auth/register/confirm | Подтверждение регистрации по коду из SMS
[**authRegisterPost**](AuthApi.md#authRegisterPost) | **post** /auth/register | Регистрация


# **auth**
> AuthSuccess auth(authParams)

Авторизация

### Example 
```dart
import 'package:main_api_client/api.dart';

var api_instance = new AuthApi();
var authParams = new AuthParams(); // AuthParams | Информация для авторизации

try { 
    var result = api_instance.auth(authParams);
    print(result);
} catch (e) {
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

# **authRefreshPost**
> AuthSuccess authRefreshPost(refreshTokenParams)

Продление JWT токена по refresh token

### Example 
```dart
import 'package:main_api_client/api.dart';

var api_instance = new AuthApi();
var refreshTokenParams = new RefreshTokenParams(); // RefreshTokenParams | 

try { 
    var result = api_instance.authRefreshPost(refreshTokenParams);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';

var api_instance = new AuthApi();
var registerConfirmParams = new RegisterConfirmParams(); // RegisterConfirmParams | 

try { 
    var result = api_instance.authRegisterConfirmPost(registerConfirmParams);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';

var api_instance = new AuthApi();
var registerParams = new RegisterParams(); // RegisterParams | 

try { 
    var result = api_instance.authRegisterPost(registerParams);
    print(result);
} catch (e) {
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

