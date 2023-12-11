# openapi.api.ThankApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**thankIdGet**](ThankApi.md#thankidget) | **GET** /thank/{id} | Поблагодарить


# **thankIdGet**
> ThankById thankIdGet(id, heart)

Поблагодарить

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getThankApi();
final int id = 789; // int | ID user to thank
final int heart = 789; // int | ID категории (сердечка)

try {
    final response = api.thankIdGet(id, heart);
    print(response);
} catch on DioError (e) {
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

