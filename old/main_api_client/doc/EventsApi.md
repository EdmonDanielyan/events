# openapi.api.EventsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eventsAddeventmemberIdGet**](EventsApi.md#eventsaddeventmemberidget) | **GET** /events/addeventmember/{id} | Добавить текущего пользователя как участника события
[**eventsRemoveeventmemberIdGet**](EventsApi.md#eventsremoveeventmemberidget) | **GET** /events/removeeventmember/{id} | Удалить текущего пользователя как участника события
[**getEventById**](EventsApi.md#geteventbyid) | **GET** /events/{id} | Получить информацию о событии по ID
[**getEvents**](EventsApi.md#getevents) | **GET** /events | Метод получения событий


# **eventsAddeventmemberIdGet**
> AddEventMember eventsAddeventmemberIdGet(id)

Добавить текущего пользователя как участника события

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getEventsApi();
final int id = 789; // int | ID события

try {
    final response = api.eventsAddeventmemberIdGet(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventsApi->eventsAddeventmemberIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID события | 

### Return type

[**AddEventMember**](AddEventMember.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsRemoveeventmemberIdGet**
> AddEventMember eventsRemoveeventmemberIdGet(id)

Удалить текущего пользователя как участника события

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getEventsApi();
final int id = 789; // int | ID события

try {
    final response = api.eventsRemoveeventmemberIdGet(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventsApi->eventsRemoveeventmemberIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID события | 

### Return type

[**AddEventMember**](AddEventMember.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEventById**
> GetEventById getEventById(id)

Получить информацию о событии по ID

Получить информацию о конкретном событии по ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getEventsApi();
final int id = 789; // int | ID события

try {
    final response = api.getEventById(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventsApi->getEventById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID события | 

### Return type

[**GetEventById**](GetEventById.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEvents**
> GetEvents getEvents(pageNumber, countOnPage)

Метод получения событий

Получить информацию о событиях

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getEventsApi();
final int pageNumber = 56; // int | Номер страницы для пагинации
final int countOnPage = 56; // int | Количество элементов на странице

try {
    final response = api.getEvents(pageNumber, countOnPage);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventsApi->getEvents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**| Номер страницы для пагинации | [optional] 
 **countOnPage** | **int**| Количество элементов на странице | [optional] 

### Return type

[**GetEvents**](GetEvents.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

