# openapi.api.NewsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**commentDelete**](NewsApi.md#commentdelete) | **DELETE** /comment/{id} | Удалить комментарий
[**commentUpdate**](NewsApi.md#commentupdate) | **PATCH** /comment/{id} | Изменить комментарий
[**getNews**](NewsApi.md#getnews) | **GET** /news | Получение списка новостей
[**newsCommentsIdGet**](NewsApi.md#newscommentsidget) | **GET** /news/comments/{id} | Получение комментариев к новости по ID
[**newsCommentsLikeIdGet**](NewsApi.md#newscommentslikeidget) | **GET** /news/comments/like/{id} | Поблагодарить комментарий
[**newsIdGet**](NewsApi.md#newsidget) | **GET** /news/{id} | Получение информации о новости по ID
[**newsLikeIdGet**](NewsApi.md#newslikeidget) | **GET** /news/like/{id} | Поблагодарить новость
[**newsPostcommentPost**](NewsApi.md#newspostcommentpost) | **POST** /news/postcomment | Создание нового комментария


# **commentDelete**
> NewsLikeSuccess commentDelete(id)

Удалить комментарий

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getNewsApi();
final int id = 789; // int | id комментария

try {
    final response = api.commentDelete(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling NewsApi->commentDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id комментария | 

### Return type

[**NewsLikeSuccess**](NewsLikeSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **commentUpdate**
> NewsLikeSuccess commentUpdate(id, patchComment)

Изменить комментарий

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getNewsApi();
final int id = 789; // int | id комментария
final PatchComment patchComment = ; // PatchComment | Информация для создания обновления

try {
    final response = api.commentUpdate(id, patchComment);
    print(response);
} catch on DioError (e) {
    print('Exception when calling NewsApi->commentUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id комментария | 
 **patchComment** | [**PatchComment**](PatchComment.md)| Информация для создания обновления | [optional] 

### Return type

[**NewsLikeSuccess**](NewsLikeSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNews**
> GetNews getNews(filter, pageNumber, countOnPage)

Получение списка новостей

Получение списка новостей по убыванию даты с пагинацией

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getNewsApi();
final String filter = filter_example; // String | фильтр для выдачи определенной группы новостей, допустимые значения news, news-idea, volunteer_news, information_sport, information_ms, literacy
final int pageNumber = 56; // int | Номер страницы для пагинации
final int countOnPage = 56; // int | Количество элементов на странице

try {
    final response = api.getNews(filter, pageNumber, countOnPage);
    print(response);
} catch on DioError (e) {
    print('Exception when calling NewsApi->getNews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **String**| фильтр для выдачи определенной группы новостей, допустимые значения news, news-idea, volunteer_news, information_sport, information_ms, literacy | [optional] 
 **pageNumber** | **int**| Номер страницы для пагинации | [optional] 
 **countOnPage** | **int**| Количество элементов на странице | [optional] 

### Return type

[**GetNews**](GetNews.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsCommentsIdGet**
> GetCommentsById newsCommentsIdGet(id)

Получение комментариев к новости по ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getNewsApi();
final int id = 789; // int | ID новости

try {
    final response = api.newsCommentsIdGet(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling NewsApi->newsCommentsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID новости | 

### Return type

[**GetCommentsById**](GetCommentsById.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsCommentsLikeIdGet**
> CommentLikeSuccess newsCommentsLikeIdGet(id)

Поблагодарить комментарий

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getNewsApi();
final int id = 789; // int | id комментария

try {
    final response = api.newsCommentsLikeIdGet(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling NewsApi->newsCommentsLikeIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id комментария | 

### Return type

[**CommentLikeSuccess**](CommentLikeSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsIdGet**
> GetNewsById newsIdGet(id)

Получение информации о новости по ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getNewsApi();
final int id = 789; // int | ID новости

try {
    final response = api.newsIdGet(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling NewsApi->newsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID новости | 

### Return type

[**GetNewsById**](GetNewsById.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsLikeIdGet**
> NewsLikeSuccess newsLikeIdGet(id)

Поблагодарить новость

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getNewsApi();
final int id = 789; // int | id новости

try {
    final response = api.newsLikeIdGet(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling NewsApi->newsLikeIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id новости | 

### Return type

[**NewsLikeSuccess**](NewsLikeSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newsPostcommentPost**
> PostCommentSuccess newsPostcommentPost(postComment)

Создание нового комментария

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = Openapi().getNewsApi();
final PostComment postComment = ; // PostComment | Информация для создания комментария

try {
    final response = api.newsPostcommentPost(postComment);
    print(response);
} catch on DioError (e) {
    print('Exception when calling NewsApi->newsPostcommentPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postComment** | [**PostComment**](PostComment.md)| Информация для создания комментария | [optional] 

### Return type

[**PostCommentSuccess**](PostCommentSuccess.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

