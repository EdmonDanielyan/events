# openapi.model.UserProfileBadge

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | Символьный код (ниже первого уровня не уникальный) | 
**name** | **String** | Название | 
**group** | **String** | Группа (например на доске почёта награды разбиты по категориям) | [optional] 
**icon** | **String** | Имя ассета иконки | 
**svg** | **String** | Полный код иконки в svg. Используется, если поле icon не задано. | [optional] 
**count** | **num** | Количество, если задано отображается рябом с бейджем | [optional] 
**label** | **String** | Короткая текстовая подпись вместо количества (пока не используется) | [optional] 
**link** | **String** | Ссылка для перехода на описание статуса (пока не используется) | [optional] 
**extra** | [**JsonObject**](.md) | Доп. данные для уникальных случаев | [optional] 
**subs** | [**BuiltList&lt;UserProfileBadge&gt;**](UserProfileBadge.md) | Датализация для \"составных\" статусов | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


