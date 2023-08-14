# main_api_client.api.NewsApi

## Load the API package
```dart
import 'package:main_api_client/api.dart';
```

All URIs are relative to *https://portal.irkutskoil.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**commentDelete**](NewsApi.md#commentDelete) | **delete** /comment/{id} | Удалить комментарий
[**commentUpdate**](NewsApi.md#commentUpdate) | **patch** /comment/{id} | Изменить комментарий
[**getNews**](NewsApi.md#getNews) | **get** /news | Получение списка новостей
[**newsCommentsIdGet**](NewsApi.md#newsCommentsIdGet) | **get** /news/comments/{id} | Получение комментариев к новости по ID
[**newsCommentsLikeIdGet**](NewsApi.md#newsCommentsLikeIdGet) | **get** /news/comments/like/{id} | Поблагодарить комментарий
[**newsIdGet**](NewsApi.md#newsIdGet) | **get** /news/{id} | Получение информации о новости по ID
[**newsLikeIdGet**](NewsApi.md#newsLikeIdGet) | **get** /news/like/{id} | Поблагодарить новость
[**newsPostcommentPost**](NewsApi.md#newsPostcommentPost) | **post** /news/postcomment | Создание нового комментария


# **commentDelete**
> NewsLikeSuccess commentDelete(id)

Удалить комментарий

### Example 
```dart
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new NewsApi();
var id = 789; // int | id комментария

try { 
    var result = api_instance.commentDelete(id);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new NewsApi();
var id = 789; // int | id комментария
var patchComment = new PatchComment(); // PatchComment | Информация для создания обновления

try { 
    var result = api_instance.commentUpdate(id, patchComment);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new NewsApi();
var filter = filter_example; // String | фильтр для выдачи определенной группы новостей, допустимые значения news, news-idea, volunteer_news, information_sport, information_ms, literacy
var pageNumber = 56; // int | Номер страницы для пагинации
var countOnPage = 56; // int | Количество элементов на странице

try { 
    var result = api_instance.getNews(filter, pageNumber, countOnPage);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new NewsApi();
var id = 789; // int | ID новости

try { 
    var result = api_instance.newsCommentsIdGet(id);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new NewsApi();
var id = 789; // int | id комментария

try { 
    var result = api_instance.newsCommentsLikeIdGet(id);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new NewsApi();
var id = 789; // int | ID новости

try { 
    var result = api_instance.newsIdGet(id);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new NewsApi();
var id = 789; // int | id новости

try { 
    var result = api_instance.newsLikeIdGet(id);
    print(result);
} catch (e) {
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
import 'package:main_api_client/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

var api_instance = new NewsApi();
var postComment = new PostComment(); // PostComment | Информация для создания комментария

try { 
    var result = api_instance.newsPostcommentPost(postComment);
    print(result);
} catch (e) {
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

