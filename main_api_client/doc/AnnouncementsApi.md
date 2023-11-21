# openapi.api.AnnouncementsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAnnouncementById**](AnnouncementsApi.md#getannouncementbyid) | **GET** /announcements/{id} | Получить информацию об объявлении по ID
[**getAnnouncements**](AnnouncementsApi.md#getannouncements) | **GET** /announcements | Получение списка событий


# **getAnnouncementById**
> GetAnnouncementById getAnnouncementById(id)

Получить информацию об объявлении по ID

Получить информацию о конкретном объявлении по ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getAnnouncementsApi();
final int id = 789; // int | ID объявления

try {
    final response = api.getAnnouncementById(id);
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getAnnouncementsApi();
final int pageNumber = 56; // int | Номер страницы для пагинации
final int countOnPage = 56; // int | Количество элементов на странице

try {
    final response = api.getAnnouncements(pageNumber, countOnPage);
    print(response);
} catch on DioError (e) {
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

