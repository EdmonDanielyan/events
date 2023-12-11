# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**keysGet**](UserApi.md#keysget) | **GET** /keys | Получение ключей шифрования текущего пользователя
[**keysIdGet**](UserApi.md#keysidget) | **GET** /keys/{id} | Получение публичного ключа другого пользователя
[**userBirthdayGet**](UserApi.md#userbirthdayget) | **GET** /user/birthday | 
[**userCaninquireGet**](UserApi.md#usercaninquireget) | **GET** /user/caninquire | Метод для получения информации может ли пользователь оставлять заявки на справки
[**userGet**](UserApi.md#userget) | **GET** /user | Получение информации о текущем пользователе
[**userGetfeedbacktagsGet**](UserApi.md#usergetfeedbacktagsget) | **GET** /user/getfeedbacktags | Возвращает тэги для формы обратной связи
[**userGetquestionsGet**](UserApi.md#usergetquestionsget) | **GET** /user/getquestions | Возвращает вопросы (обратная связь)
[**userGetreferenceautofillGet**](UserApi.md#usergetreferenceautofillget) | **GET** /user/getreferenceautofill | Автозаполняемые поля для формы справок
[**userIdGet**](UserApi.md#useridget) | **GET** /user/{id} | Получение информации о пользователе по ID
[**userMovementsGet**](UserApi.md#usermovementsget) | **GET** /user/movements | Получение информации о кадровых перемещениях текущего пользователя
[**userOrderdmsPost**](UserApi.md#userorderdmspost) | **POST** /user/orderdms | Метод для заказа ДМС
[**userOrderreferencePost**](UserApi.md#userorderreferencepost) | **POST** /user/orderreference | Метод для заказа справок
[**userOrdertransportPost**](UserApi.md#userordertransportpost) | **POST** /user/ordertransport | Метод для заказа транспорта
[**userReferenceorderformGet**](UserApi.md#userreferenceorderformget) | **GET** /user/referenceorderform | Возвращает вспомогательные данные для формы заказа транспорта
[**userSendfeedbackPost**](UserApi.md#usersendfeedbackpost) | **POST** /user/sendfeedback | Метод для отправки обратной связи (вопроса руководству)
[**userTranspontorderformGet**](UserApi.md#usertranspontorderformget) | **GET** /user/transpontorderform | Возвращает вспомогательные данные для формы заказа транспорта
[**usersPost**](UserApi.md#userspost) | **POST** /users | Получение информации о пользователях


# **keysGet**
> GetKeysSuccess keysGet()

Получение ключей шифрования текущего пользователя

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.keysGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final int id = 789; // int | ID пользователя

try {
    final response = api.keysIdGet(id);
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.userBirthdayGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.userCaninquireGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.userGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.userGetfeedbacktagsGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final int pageNumber = 56; // int | Номер страницы для пагинации
final int countOnPage = 56; // int | Количество элементов на странице

try {
    final response = api.userGetquestionsGet(pageNumber, countOnPage);
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.userGetreferenceautofillGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final int id = 789; // int | ID пользователя

try {
    final response = api.userIdGet(id);
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.userMovementsGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final OrderDMS orderDMS = ; // OrderDMS | Данные для заказа полиса.   Если в автозаполнении указан organisation_id, то выбор организации должен быть заблокирован 

try {
    final response = api.userOrderdmsPost(orderDMS);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UserApi->userOrderdmsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderDMS** | [**OrderDMS**](OrderDMS.md)| Данные для заказа полиса.   Если в автозаполнении указан organisation_id, то выбор организации должен быть заблокирован  | [optional] 

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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final String referenceType = referenceType_example; // String | 
final String phone = phone_example; // String | 
final String way = way_example; // String | 
final String postalCode = postalCode_example; // String | 
final String address = address_example; // String | 
final String period = period_example; // String | 
final String destination = destination_example; // String | 
final int num_ = 56; // int | 
final String child = child_example; // String | 
final String dateStart = dateStart_example; // String | 
final String dateEnd = dateEnd_example; // String | 
final BuiltList<MultipartFile> filesLeftSquareBracketRightSquareBracket = /path/to/file.txt; // BuiltList<MultipartFile> | 

try {
    final response = api.userOrderreferencePost(referenceType, phone, way, postalCode, address, period, destination, num_, child, dateStart, dateEnd, filesLeftSquareBracketRightSquareBracket);
    print(response);
} catch on DioError (e) {
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
 **filesLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | [optional] 

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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final String fio = fio_example; // String | 
final String phone = phone_example; // String | 
final int status = 56; // int | 
final String date = date_example; // String | 
final String time = time_example; // String | 
final String place = place_example; // String | 
final String howLong = howLong_example; // String | 
final String passengers = passengers_example; // String | 
final String route = route_example; // String | 
final BuiltList<MultipartFile> filesLeftSquareBracketRightSquareBracket = /path/to/file.txt; // BuiltList<MultipartFile> | 

try {
    final response = api.userOrdertransportPost(fio, phone, status, date, time, place, howLong, passengers, route, filesLeftSquareBracketRightSquareBracket);
    print(response);
} catch on DioError (e) {
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
 **filesLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | [optional] 

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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.userReferenceorderformGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final String question = question_example; // String | 
final String tags = tags_example; // String | 
final String fio = fio_example; // String | 
final String contacts = contacts_example; // String | 
final BuiltList<MultipartFile> filesLeftSquareBracketRightSquareBracket = /path/to/file.txt; // BuiltList<MultipartFile> | 

try {
    final response = api.userSendfeedbackPost(question, tags, fio, contacts, filesLeftSquareBracketRightSquareBracket);
    print(response);
} catch on DioError (e) {
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
 **filesLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | [optional] 

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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.userTranspontorderformGet();
    print(response);
} catch on DioError (e) {
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
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final GetUsers getUsers = ; // GetUsers | 

try {
    final response = api.usersPost(getUsers);
    print(response);
} catch on DioError (e) {
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

