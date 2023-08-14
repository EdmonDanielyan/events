# main_api_client.api.ThankApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**thankIdGet**](ThankApi.md#thankIdGet) | **get** /thank/{id} | Поблагодарить


# **thankIdGet**
> ThankById thankIdGet(id, heart)

Поблагодарить

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new ThankApi();
var id = 789; // int | ID user to thank
var heart = 789; // int | ID категории (сердечка)

try { 
    var result = api_instance.thankIdGet(id, heart);
    print(result);
} catch (e) {
    print('Exception when calling ThankApi->thankIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID user to thank | 
 **heart** | **int**| ID категории (сердечка) | 

### Return type

[**ThankById**](ThankById.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

