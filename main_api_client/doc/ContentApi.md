# main_api_client.api.ContentApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://test.ink.vpool.qsoft.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pagesPagesGet**](ContentApi.md#pagesPagesGet) | **get** /pages/pages | Получает список страниц с не пустыми сивольными кода. Для отладки.
[**pagesPagesIdOrCodeGet**](ContentApi.md#pagesPagesIdOrCodeGet) | **get** /pages/pages/{idOrCode} | Получает полный текст страницы.
[**pagesSectionsCodeGet**](ContentApi.md#pagesSectionsCodeGet) | **get** /pages/sections/{code} | Получить список страниц раздела. Например, список страниц для раздела \&quot;социальная ответственность\&quot;.
[**pagesSectionsGet**](ContentApi.md#pagesSectionsGet) | **get** /pages/sections | Получить список разделов страниц.
[**snippetsGet**](ContentApi.md#snippetsGet) | **get** /snippets | Получить список текстовых фрагментов для использования в интерфейсе.


# **pagesPagesGet**
> ListPageSuccessResponseBody pagesPagesGet()

Получает список страниц с не пустыми сивольными кода. Для отладки.

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContentApi();

try { 
    var result = api_instance.pagesPagesGet();
    print(result);
} catch (e) {
    print('Exception when calling ContentApi->pagesPagesGet: $e\n');
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

# **pagesPagesIdOrCodeGet**
> SinglePageResponseData pagesPagesIdOrCodeGet(idOrCode)

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
    var result = api_instance.pagesPagesIdOrCodeGet(idOrCode);
    print(result);
} catch (e) {
    print('Exception when calling ContentApi->pagesPagesIdOrCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idOrCode** | **String**| ID или символьный код страницы | 

### Return type

[**SinglePageResponseData**](SinglePageResponseData.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pagesSectionsCodeGet**
> SingleSectionSuccessResponseBody pagesSectionsCodeGet(code)

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
    var result = api_instance.pagesSectionsCodeGet(code);
    print(result);
} catch (e) {
    print('Exception when calling ContentApi->pagesSectionsCodeGet: $e\n');
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

# **pagesSectionsGet**
> ListSectionSuccessResponseBody pagesSectionsGet()

Получить список разделов страниц.

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContentApi();

try { 
    var result = api_instance.pagesSectionsGet();
    print(result);
} catch (e) {
    print('Exception when calling ContentApi->pagesSectionsGet: $e\n');
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

# **snippetsGet**
> ListSnippetSuccessResponseBody snippetsGet()

Получить список текстовых фрагментов для использования в интерфейсе.

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContentApi();

try { 
    var result = api_instance.snippetsGet();
    print(result);
} catch (e) {
    print('Exception when calling ContentApi->snippetsGet: $e\n');
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

