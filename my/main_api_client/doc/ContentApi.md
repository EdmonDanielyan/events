# openapi.api.ContentApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPage**](ContentApi.md#getpage) | **GET** /pages/pages/{idOrCode} | Получает полный текст страницы.
[**getPagesList**](ContentApi.md#getpageslist) | **GET** /pages/pages | Получает список страниц с не пустыми сивольными кода. Для отладки.
[**getPagesSection**](ContentApi.md#getpagessection) | **GET** /pages/sections/{code} | Получить список страниц раздела. Например, список страниц для раздела \&quot;социальная ответственность\&quot;.
[**getPagesSectionsList**](ContentApi.md#getpagessectionslist) | **GET** /pages/sections | Получить список разделов страниц.
[**getSnippetsList**](ContentApi.md#getsnippetslist) | **GET** /snippets | Получить список текстовых фрагментов для использования в интерфейсе.
[**uniEventsGetDetail**](ContentApi.md#unieventsgetdetail) | **GET** /uni_evens/{id} | Детальная информация о событии
[**uniEventsGetList**](ContentApi.md#unieventsgetlist) | **GET** /uni_evens | Список событий


# **getPage**
> SinglePageSuccessResponseBody getPage(idOrCode)

Получает полный текст страницы.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getContentApi();
final String idOrCode = idOrCode_example; // String | ID или символьный код страницы

try {
    final response = api.getPage(idOrCode);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentApi->getPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idOrCode** | **String**| ID или символьный код страницы | 

### Return type

[**SinglePageSuccessResponseBody**](SinglePageSuccessResponseBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPagesList**
> ListPageSuccessResponseBody getPagesList()

Получает список страниц с не пустыми сивольными кода. Для отладки.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getContentApi();

try {
    final response = api.getPagesList();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentApi->getPagesList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListPageSuccessResponseBody**](ListPageSuccessResponseBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPagesSection**
> SingleSectionSuccessResponseBody getPagesSection(code)

Получить список страниц раздела. Например, список страниц для раздела \"социальная ответственность\".

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getContentApi();
final String code = code_example; // String | Символьный код раздела

try {
    final response = api.getPagesSection(code);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentApi->getPagesSection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| Символьный код раздела | 

### Return type

[**SingleSectionSuccessResponseBody**](SingleSectionSuccessResponseBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPagesSectionsList**
> ListSectionSuccessResponseBody getPagesSectionsList()

Получить список разделов страниц.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getContentApi();

try {
    final response = api.getPagesSectionsList();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentApi->getPagesSectionsList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListSectionSuccessResponseBody**](ListSectionSuccessResponseBody.md)

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

final api = Openapi().getContentApi();

try {
    final response = api.getSnippetsList();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentApi->getSnippetsList: $e\n');
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

# **uniEventsGetDetail**
> UniEventsGetDetailRespBody uniEventsGetDetail(id)

Детальная информация о событии

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getContentApi();
final String id = id_example; // String | ID подписки (не события)

try {
    final response = api.uniEventsGetDetail(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentApi->uniEventsGetDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID подписки (не события) | 

### Return type

[**UniEventsGetDetailRespBody**](UniEventsGetDetailRespBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uniEventsGetList**
> UniEventsGetListRespBody uniEventsGetList()

Список событий

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getContentApi();

try {
    final response = api.uniEventsGetList();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentApi->uniEventsGetList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UniEventsGetListRespBody**](UniEventsGetListRespBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

