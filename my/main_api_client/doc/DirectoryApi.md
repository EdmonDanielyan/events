# openapi.api.DirectoryApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getOrganisationDirectory**](DirectoryApi.md#getorganisationdirectory) | **GET** /directory/organisation | Справочник организаций


# **getOrganisationDirectory**
> OrganisationDirectoryResponseBody getOrganisationDirectory()

Справочник организаций

Получение полного справочника организаций для использования в формах

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDirectoryApi();

try {
    final response = api.getOrganisationDirectory();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DirectoryApi->getOrganisationDirectory: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OrganisationDirectoryResponseBody**](OrganisationDirectoryResponseBody.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

