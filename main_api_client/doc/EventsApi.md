# main_api_client.api.EventsApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://test.ink.vpool.qsoft.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eventsAddeventmemberIdGet**](EventsApi.md#eventsAddeventmemberIdGet) | **get** /events/addeventmember/{id} | Добавить текущего пользователя как участника события
[**getEventById**](EventsApi.md#getEventById) | **get** /events/{id} | Получить информацию о событии по ID
[**getEvents**](EventsApi.md#getEvents) | **get** /events | Метод получения событий


# **eventsAddeventmemberIdGet**
> AddEventMember eventsAddeventmemberIdGet(id)

Добавить текущего пользователя как участника события

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new EventsApi();
var id = 789; // int | ID события

try { 
    var result = api_instance.eventsAddeventmemberIdGet(id);
    print(result);
} catch (e) {
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

# **getEventById**
> GetEventById getEventById(id)

Получить информацию о событии по ID

Получить информацию о конкретном событии по ID

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new EventsApi();
var id = 789; // int | ID события

try { 
    var result = api_instance.getEventById(id);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new EventsApi();
var pageNumber = 56; // int | Номер страницы для пагинации
var countOnPage = 56; // int | Количество элементов на странице

try { 
    var result = api_instance.getEvents(pageNumber, countOnPage);
    print(result);
} catch (e) {
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

