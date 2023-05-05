# main_api_client.api.UserApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**keysGet**](UserApi.md#keysGet) | **get** /keys | Получение ключей шифрования текущего пользователя
[**keysIdGet**](UserApi.md#keysIdGet) | **get** /keys/{id} | Получение публичного ключа другого пользователя
[**userBirthdayGet**](UserApi.md#userBirthdayGet) | **get** /user/birthday | 
[**userCaninquireGet**](UserApi.md#userCaninquireGet) | **get** /user/caninquire | Метод для получения информации может ли пользователь оставлять заявки на справки
[**userGet**](UserApi.md#userGet) | **get** /user | Получение информации о текущем пользователе
[**userGetfeedbacktagsGet**](UserApi.md#userGetfeedbacktagsGet) | **get** /user/getfeedbacktags | Возвращает тэги для формы обратной связи
[**userGetquestionsGet**](UserApi.md#userGetquestionsGet) | **get** /user/getquestions | Возвращает вопросы (обратная связь)
[**userGetreferenceautofillGet**](UserApi.md#userGetreferenceautofillGet) | **get** /user/getreferenceautofill | Автозаполняемые поля для формы справок
[**userIdGet**](UserApi.md#userIdGet) | **get** /user/{id} | Получение информации о пользователе по ID
[**userMovementsGet**](UserApi.md#userMovementsGet) | **get** /user/movements | Получение информации о кадровых перемещениях текущего пользователя
[**userOrderdmsPost**](UserApi.md#userOrderdmsPost) | **post** /user/orderdms | Метод для заказа ДМС
[**userOrderreferencePost**](UserApi.md#userOrderreferencePost) | **post** /user/orderreference | Метод для заказа справок
[**userOrdertransportPost**](UserApi.md#userOrdertransportPost) | **post** /user/ordertransport | Метод для заказа транспорта
[**userReferenceorderformGet**](UserApi.md#userReferenceorderformGet) | **get** /user/referenceorderform | Возвращает вспомогательные данные для формы заказа транспорта
[**userSendfeedbackPost**](UserApi.md#userSendfeedbackPost) | **post** /user/sendfeedback | Метод для отправки обратной связи (вопроса руководству)
[**userTranspontorderformGet**](UserApi.md#userTranspontorderformGet) | **get** /user/transpontorderform | Возвращает вспомогательные данные для формы заказа транспорта
[**usersPost**](UserApi.md#usersPost) | **post** /users | Получение информации о пользователях


# **keysGet**
> GetKeysSuccess keysGet()

Получение ключей шифрования текущего пользователя

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.keysGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->keysGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetKeysSuccess**](GetKeysSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **keysIdGet**
> GetPubKeySuccess keysIdGet(id)

Получение публичного ключа другого пользователя

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var id = 789; // int | ID пользователя

try { 
    var result = api_instance.keysIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->keysIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID пользователя | 

### Return type

[**GetPubKeySuccess**](GetPubKeySuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **userGetfeedbacktagsGet**
> FeedbackTagsList userGetfeedbacktagsGet()

Возвращает тэги для формы обратной связи

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.userGetfeedbacktagsGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userGetfeedbacktagsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**FeedbackTagsList**](FeedbackTagsList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userGetquestionsGet**
> QuestionsList userGetquestionsGet(pageNumber, countOnPage)

Возвращает вопросы (обратная связь)

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var pageNumber = 56; // int | Номер страницы для пагинации
var countOnPage = 56; // int | Количество элементов на странице

try { 
    var result = api_instance.userGetquestionsGet(pageNumber, countOnPage);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userGetquestionsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**| Номер страницы для пагинации | [optional] 
 **countOnPage** | **int**| Количество элементов на странице | [optional] 

### Return type

[**QuestionsList**](QuestionsList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userGetreferenceautofillGet**
> ReferenceAutoFill userGetreferenceautofillGet()

Автозаполняемые поля для формы справок

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.userGetreferenceautofillGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userGetreferenceautofillGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ReferenceAutoFill**](ReferenceAutoFill.md)

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

# **userOrderdmsPost**
> OrderDMSSuccess userOrderdmsPost(orderDMS)

Метод для заказа ДМС

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var orderDMS = new OrderDMS(); // OrderDMS | Данные для заказа полиса

try { 
    var result = api_instance.userOrderdmsPost(orderDMS);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userOrderdmsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderDMS** | [**OrderDMS**](OrderDMS.md)| Данные для заказа полиса | [optional] 

### Return type

[**OrderDMSSuccess**](OrderDMSSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userOrderreferencePost**
> OrderReferenceSuccess userOrderreferencePost(referenceType, phone, way, postalCode, address, period, destination, num_, child, dateStart, dateEnd, filesLeftSquareBracketRightSquareBracket)

Метод для заказа справок

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var referenceType = referenceType_example; // String | 
var phone = phone_example; // String | 
var way = way_example; // String | 
var postalCode = postalCode_example; // String | 
var address = address_example; // String | 
var period = period_example; // String | 
var destination = destination_example; // String | 
var num_ = 56; // int | 
var child = child_example; // String | 
var dateStart = dateStart_example; // String | 
var dateEnd = dateEnd_example; // String | 
var filesLeftSquareBracketRightSquareBracket = [BINARY_DATA_HERE]; // BuiltList<Uint8List> | 

try { 
    var result = api_instance.userOrderreferencePost(referenceType, phone, way, postalCode, address, period, destination, num_, child, dateStart, dateEnd, filesLeftSquareBracketRightSquareBracket);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userOrderreferencePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **referenceType** | **String**|  | [default to 'employment_center, visa, sick_leave, income_2ndfl, income, child_allowance, child_allowance_1.5_years, FIFO, work_at_company, average_earnings, payroll_account, funds_withholding, labor_activity, employment_record']
 **phone** | **String**|  | [default to '+71231234567']
 **way** | **String**|  | [default to 'BUH, SECURITY_UK, OK_IRK, OK_UK, INKTKRS, POST']
 **postalCode** | **String**|  | [optional] 
 **address** | **String**|  | [optional] 
 **period** | **String**|  | [optional] 
 **destination** | **String**|  | [optional] 
 **num_** | **int**|  | [optional] 
 **child** | **String**|  | [optional] 
 **dateStart** | **String**|  | [optional] 
 **dateEnd** | **String**|  | [optional] 
 **filesLeftSquareBracketRightSquareBracket** | [**BuiltList<Uint8List>**](Uint8List.md)|  | [optional] 

### Return type

[**OrderReferenceSuccess**](OrderReferenceSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
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

# **userReferenceorderformGet**
> GetReferenceOrderForm userReferenceorderformGet()

Возвращает вспомогательные данные для формы заказа транспорта

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();

try { 
    var result = api_instance.userReferenceorderformGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userReferenceorderformGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetReferenceOrderForm**](GetReferenceOrderForm.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userSendfeedbackPost**
> SendFeedbackSuccess userSendfeedbackPost(question, tags, fio, contacts, filesLeftSquareBracketRightSquareBracket)

Метод для отправки обратной связи (вопроса руководству)

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var question = question_example; // String | 
var tags = tags_example; // String | 
var fio = fio_example; // String | 
var contacts = contacts_example; // String | 
var filesLeftSquareBracketRightSquareBracket = [BINARY_DATA_HERE]; // BuiltList<Uint8List> | 

try { 
    var result = api_instance.userSendfeedbackPost(question, tags, fio, contacts, filesLeftSquareBracketRightSquareBracket);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userSendfeedbackPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **question** | **String**|  | 
 **tags** | **String**|  | 
 **fio** | **String**|  | [optional] 
 **contacts** | **String**|  | [optional] 
 **filesLeftSquareBracketRightSquareBracket** | [**BuiltList<Uint8List>**](Uint8List.md)|  | [optional] 

### Return type

[**SendFeedbackSuccess**](SendFeedbackSuccess.md)

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

# **usersPost**
> GetUsersSuccess usersPost(getUsers)

Получение информации о пользователях

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new UserApi();
var getUsers = new GetUsers(); // GetUsers | 

try { 
    var result = api_instance.usersPost(getUsers);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->usersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getUsers** | [**GetUsers**](GetUsers.md)|  | [optional] 

### Return type

[**GetUsersSuccess**](GetUsersSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

