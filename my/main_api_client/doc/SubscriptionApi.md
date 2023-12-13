# openapi.api.SubscriptionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**uniSubCancel**](SubscriptionApi.md#unisubcancel) | **DELETE** /uni_sub/{id} | Состояние подписки
[**uniSubGetState**](SubscriptionApi.md#unisubgetstate) | **GET** /uni_sub/{id} | Состояние подписки
[**uniSubSubscribe**](SubscriptionApi.md#unisubsubscribe) | **POST** /uni_sub/{id} | Состояние подписки


# **uniSubCancel**
> UniSubGetStateRespBody uniSubCancel(id, uniSubCancelRequest)

Состояние подписки

Получить состояние подписки для текущего пользователя. Требует авторизации.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getSubscriptionApi();
final String id = id_example; // String | ID подписки (не события)
final UniSubCancelRequest uniSubCancelRequest = ; // UniSubCancelRequest | Запрос на отмену записи

try {
    final response = api.uniSubCancel(id, uniSubCancelRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubscriptionApi->uniSubCancel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID подписки (не события) | 
 **uniSubCancelRequest** | [**UniSubCancelRequest**](UniSubCancelRequest.md)| Запрос на отмену записи | [optional] 

### Return type

[**UniSubGetStateRespBody**](UniSubGetStateRespBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uniSubGetState**
> UniSubGetStateRespBody uniSubGetState(id)

Состояние подписки

Получить состояние подписки для текущего пользователя. Требует авторизации.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getSubscriptionApi();
final String id = id_example; // String | ID подписки (не события)

try {
    final response = api.uniSubGetState(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubscriptionApi->uniSubGetState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID подписки (не события) | 

### Return type

[**UniSubGetStateRespBody**](UniSubGetStateRespBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uniSubSubscribe**
> UniSubGetStateRespBody uniSubSubscribe(id, uniSubRequest)

Состояние подписки

Получить состояние подписки для текущего пользователя. Требует авторизации.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getSubscriptionApi();
final String id = id_example; // String | ID подписки (не события)
final UniSubRequest uniSubRequest = ; // UniSubRequest | Запрос на запись

try {
    final response = api.uniSubSubscribe(id, uniSubRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubscriptionApi->uniSubSubscribe: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID подписки (не события) | 
 **uniSubRequest** | [**UniSubRequest**](UniSubRequest.md)| Запрос на запись | [optional] 

### Return type

[**UniSubGetStateRespBody**](UniSubGetStateRespBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

