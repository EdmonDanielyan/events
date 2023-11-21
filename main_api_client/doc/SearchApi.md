# openapi.api.SearchApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**searchGet**](SearchApi.md#searchget) | **GET** /search | Метод поиска по сотрудниками, объявлениям, событиям, новостям


# **searchGet**
> GetSearchSuccess searchGet(query)

Метод поиска по сотрудниками, объявлениям, событиям, новостям

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getSearchApi();
final String query = query_example; // String | поисковый запрос

try {
    final response = api.searchGet(query);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SearchApi->searchGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| поисковый запрос | [optional] 

### Return type

[**GetSearchSuccess**](GetSearchSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

