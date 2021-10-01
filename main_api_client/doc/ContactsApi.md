# main_api_client.api.ContactsApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://mobile.ink.vpool.qsoft.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getContacts**](ContactsApi.md#getContacts) | **get** /contacts | Получение контактов


# **getContacts**
> GetContacts getContacts(search, pageNumber, countOnPage)

Получение контактов

Получение контактов (пользователей) в поиске мессенджера по введенной строке. Совпадение проверяется по ФИО без учета ошибок.

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ContactsApi();
var search = search_example; // String | Строка, введенная пользователем для поиска
var pageNumber = 56; // int | Номер страницы для пагинации
var countOnPage = 56; // int | Количество элементов на странице

try { 
    var result = api_instance.getContacts(search, pageNumber, countOnPage);
    print(result);
} catch (e) {
    print('Exception when calling ContactsApi->getContacts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **String**| Строка, введенная пользователем для поиска | [optional] [default to '']
 **pageNumber** | **int**| Номер страницы для пагинации | [optional] [default to 1]
 **countOnPage** | **int**| Количество элементов на странице | [optional] [default to 50]

### Return type

[**GetContacts**](GetContacts.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

