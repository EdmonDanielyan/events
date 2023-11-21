# openapi.api.GlobalApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllNotificationsState**](GlobalApi.md#getallnotificationsstate) | **GET** /config/notifications | Все уведомления
[**getNotificationSub**](GlobalApi.md#getnotificationsub) | **GET** /config/notifications/{channel}/{targetId} | Получить подписку на чат
[**getSettings**](GlobalApi.md#getsettings) | **GET** /settings | Настройки приложения
[**getSnippetsList**](GlobalApi.md#getsnippetslist) | **GET** /snippets | Получить список текстовых фрагментов для использования в интерфейсе.
[**resetNotificationSub**](GlobalApi.md#resetnotificationsub) | **DELETE** /config/notifications/{channel}/{targetId} | Сбросить уведомления
[**setNotificationSub**](GlobalApi.md#setnotificationsub) | **POST** /config/notifications/{channel}/{targetId} | Изменить подписку на чат


# **getAllNotificationsState**
> NotificationFullList getAllNotificationsState()

Все уведомления

Получение полного списка подписок на уведомления по всем источникам

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGlobalApi();

try {
    final response = api.getAllNotificationsState();
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlobalApi->getAllNotificationsState: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**NotificationFullList**](NotificationFullList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNotificationSub**
> NotificationSubState getNotificationSub(channel, targetId)

Получить подписку на чат

Получение состояния подписки на уведомления о сообщениях в чате

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGlobalApi();
final String channel = channel_example; // String | Тип события для подписки. На старте только для чатов
final String targetId = targetId_example; // String | Id подписки

try {
    final response = api.getNotificationSub(channel, targetId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlobalApi->getNotificationSub: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **channel** | **String**| Тип события для подписки. На старте только для чатов | 
 **targetId** | **String**| Id подписки | 

### Return type

[**NotificationSubState**](NotificationSubState.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSettings**
> GlobalSettingsResponseBody getSettings()

Настройки приложения

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getGlobalApi();

try {
    final response = api.getSettings();
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlobalApi->getSettings: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GlobalSettingsResponseBody**](GlobalSettingsResponseBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSnippetsList**
> ListSnippetSuccessResponseBody getSnippetsList()

Получить список текстовых фрагментов для использования в интерфейсе.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getGlobalApi();

try {
    final response = api.getSnippetsList();
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlobalApi->getSnippetsList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListSnippetSuccessResponseBody**](ListSnippetSuccessResponseBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetNotificationSub**
> NotificationSubState resetNotificationSub(channel, targetId)

Сбросить уведомления

Сбросить подписку на уведомления в состояние \"по умолчанию\"

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGlobalApi();
final String channel = channel_example; // String | Тип события для подписки. На старте только для чатов
final String targetId = targetId_example; // String | Id подписки

try {
    final response = api.resetNotificationSub(channel, targetId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlobalApi->resetNotificationSub: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **channel** | **String**| Тип события для подписки. На старте только для чатов | 
 **targetId** | **String**| Id подписки | 

### Return type

[**NotificationSubState**](NotificationSubState.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setNotificationSub**
> NotificationSubState setNotificationSub(channel, targetId, value)

Изменить подписку на чат

Изменить подписку на уведомления о сообщениях в чате

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGlobalApi();
final String channel = channel_example; // String | Тип события для подписки. На старте только для чатов
final String targetId = targetId_example; // String | Id подписки
final bool value = true; // bool | 

try {
    final response = api.setNotificationSub(channel, targetId, value);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlobalApi->setNotificationSub: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **channel** | **String**| Тип события для подписки. На старте только для чатов | 
 **targetId** | **String**| Id подписки | 
 **value** | **bool**|  | [optional] 

### Return type

[**NotificationSubState**](NotificationSubState.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

