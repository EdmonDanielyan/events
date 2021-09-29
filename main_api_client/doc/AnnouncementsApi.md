# main_api_client.api.AnnouncementsApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://mobile.ink.vpool.qsoft.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAnnouncementById**](AnnouncementsApi.md#getAnnouncementById) | **get** /announcements/{id} | Получить информацию об объявлении по ID
[**getAnnouncements**](AnnouncementsApi.md#getAnnouncements) | **get** /announcements | Получение списка событий


# **getAnnouncementById**
> GetAnnouncementById getAnnouncementById(id)

Получить информацию об объявлении по ID

Получить информацию о конкретном объявлении по ID

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new AnnouncementsApi();
var id = 789; // int | ID объявления

try { 
    var result = api_instance.getAnnouncementById(id);
    print(result);
} catch (e) {
    print('Exception when calling AnnouncementsApi->getAnnouncementById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID объявления | 

### Return type

[**GetAnnouncementById**](GetAnnouncementById.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAnnouncements**
> GetAnnouncements getAnnouncements(pageNumber, countOnPage)

Получение списка событий

Получение списка событий по убыванию даты создания с пагинацией

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new AnnouncementsApi();
var pageNumber = 56; // int | Номер страницы для пагинации
var countOnPage = 56; // int | Количество элементов на странице

try { 
    var result = api_instance.getAnnouncements(pageNumber, countOnPage);
    print(result);
} catch (e) {
    print('Exception when calling AnnouncementsApi->getAnnouncements: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**| Номер страницы для пагинации | [optional] 
 **countOnPage** | **int**| Количество элементов на странице | [optional] 

### Return type

[**GetAnnouncements**](GetAnnouncements.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

