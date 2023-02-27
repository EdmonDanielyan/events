# main_api_client.api.ContentApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPage**](ContentApi.md#getPage) | **get** /pages/pages/{idOrCode} | Получает полный текст страницы.
[**getPagesList**](ContentApi.md#getPagesList) | **get** /pages/pages | Получает список страниц с не пустыми сивольными кода. Для отладки.
[**getPagesSection**](ContentApi.md#getPagesSection) | **get** /pages/sections/{code} | Получить список страниц раздела. Например, список страниц для раздела \&quot;социальная ответственность\&quot;.
[**getPagesSectionsList**](ContentApi.md#getPagesSectionsList) | **get** /pages/sections | Получить список разделов страниц.
[**getSnippetsList**](ContentApi.md#getSnippetsList) | **get** /snippets | Получить список текстовых фрагментов для использования в интерфейсе.


# **getPage**
> SinglePageSuccessResponseBody getPage(idOrCode)

Получает полный текст страницы.

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContentApi();
var idOrCode = idOrCode_example; // String | ID или символьный код страницы

try { 
    var result = api_instance.getPage(idOrCode);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContentApi();

try { 
    var result = api_instance.getPagesList();
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContentApi();
var code = code_example; // String | Символьный код раздела

try { 
    var result = api_instance.getPagesSection(code);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContentApi();

try { 
    var result = api_instance.getPagesSectionsList();
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContentApi();

try { 
    var result = api_instance.getSnippetsList();
    print(result);
} catch (e) {
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

