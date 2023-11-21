# openapi.api.PublicationsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**publicationsGet**](PublicationsApi.md#publicationsget) | **GET** /publications | ИНК-Знание - Публикации


# **publicationsGet**
> GetPublications publicationsGet(pageNumber, countOnPage)

ИНК-Знание - Публикации

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getPublicationsApi();
final int pageNumber = 56; // int | Номер страницы для пагинации
final int countOnPage = 56; // int | Количество элементов на странице

try {
    final response = api.publicationsGet(pageNumber, countOnPage);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PublicationsApi->publicationsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**| Номер страницы для пагинации | [optional] 
 **countOnPage** | **int**| Количество элементов на странице | [optional] 

### Return type

[**GetPublications**](GetPublications.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

