# main_api_client.api.UserApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *http://mobile.ink.vpool/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userBirthdayGet**](UserApi.md#userBirthdayGet) | **get** /user/birthday | 
[**userCaninquireGet**](UserApi.md#userCaninquireGet) | **get** /user/caninquire | Метод для получения информации может ли пользователь оставлять заявки на справки
[**userGet**](UserApi.md#userGet) | **get** /user | Получение информации о текущем пользователе
[**userIdGet**](UserApi.md#userIdGet) | **get** /user/{id} | Получение информации о пользователе по ID
[**userMovementsGet**](UserApi.md#userMovementsGet) | **get** /user/movements | Получение информации о кадровых перемещениях текущего пользователя
[**userOrderreferencePost**](UserApi.md#userOrderreferencePost) | **post** /user/orderreference | Метод для заказа справок
[**userOrdertransportPost**](UserApi.md#userOrdertransportPost) | **post** /user/ordertransport | Метод для заказа транспорта
[**userTranspontorderformGet**](UserApi.md#userTranspontorderformGet) | **get** /user/transpontorderform | Возвращает вспомогательные данные для формы заказа транспорта


# **userBirthdayGet**
> BirthdaysSuccess userBirthdayGet()



### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.userBirthdayGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userBirthdayGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BirthdaysSuccess**](BirthdaysSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userCaninquireGet**
> CanInquire userCaninquireGet()

Метод для получения информации может ли пользователь оставлять заявки на справки

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.userCaninquireGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userCaninquireGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CanInquire**](CanInquire.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userGet**
> GetUserSuccess userGet()

Получение информации о текущем пользователе

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.userGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetUserSuccess**](GetUserSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userIdGet**
> GetUserSuccess userIdGet(id)

Получение информации о пользователе по ID

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var id = 789; // int | ID пользователя

try { 
    var result = api_instance.userIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID пользователя | 

### Return type

[**GetUserSuccess**](GetUserSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userMovementsGet**
> MovementsSuccess userMovementsGet()

Получение информации о кадровых перемещениях текущего пользователя

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.userMovementsGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userMovementsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MovementsSuccess**](MovementsSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userOrderreferencePost**
> OrderReferenceSuccess userOrderreferencePost(orderReference)

Метод для заказа справок

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var orderReference = new OrderReference(); // OrderReference | Данные для заказа справки

try { 
    var result = api_instance.userOrderreferencePost(orderReference);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userOrderreferencePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderReference** | [**OrderReference**](OrderReference.md)| Данные для заказа справки | [optional] 

### Return type

[**OrderReferenceSuccess**](OrderReferenceSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userOrdertransportPost**
> OrderTransportSuccess userOrdertransportPost(fio, phone, status, date, time, place, howLong, passengers, route, filesLeftSquareBracketRightSquareBracket)

Метод для заказа транспорта

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var fio = fio_example; // String | 
var phone = phone_example; // String | 
var status = 56; // int | 
var date = date_example; // String | 
var time = time_example; // String | 
var place = place_example; // String | 
var howLong = howLong_example; // String | 
var passengers = passengers_example; // String | 
var route = route_example; // String | 
var filesLeftSquareBracketRightSquareBracket = [BINARY_DATA_HERE]; // BuiltList<Uint8List> | 

try { 
    var result = api_instance.userOrdertransportPost(fio, phone, status, date, time, place, howLong, passengers, route, filesLeftSquareBracketRightSquareBracket);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userOrdertransportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fio** | **String**|  | 
 **phone** | **String**|  | 
 **status** | **int**|  | 
 **date** | **String**|  | 
 **time** | **String**|  | 
 **place** | **String**|  | 
 **howLong** | **String**|  | 
 **passengers** | **String**|  | 
 **route** | **String**|  | 
 **filesLeftSquareBracketRightSquareBracket** | [**BuiltList<Uint8List>**](Uint8List.md)|  | [optional] 

### Return type

[**OrderTransportSuccess**](OrderTransportSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userTranspontorderformGet**
> GetTransportOrderForm userTranspontorderformGet()

Возвращает вспомогательные данные для формы заказа транспорта

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.userTranspontorderformGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userTranspontorderformGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetTransportOrderForm**](GetTransportOrderForm.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

