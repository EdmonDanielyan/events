# openapi.model.SubscriptionState

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**v** | **int** | Версия формата | [optional] 
**id** | **String** | ID события записи | [optional] 
**subscribed** | **bool** | Пользователь подписан на событие | [optional] 
**canSubscribe** | **bool** | Можно записаться на событие | [optional] 
**canUnsubscribe** | **bool** | Можно отменить запись | [optional] 
**statusMessage** | **String** | Доп. сообщение с причиной невозможности подписки/отписки | [optional] 
**config** | [**SubscriptionConfig**](SubscriptionConfig.md) |  | [optional] 
**fields** | [**BuiltList&lt;SubscriptionField&gt;**](SubscriptionField.md) | Поля формы записи (если доступна запись) | [optional] 
**options** | [**BuiltList&lt;SubscriptionOption&gt;**](SubscriptionOption.md) | Опции формы записи (если доступна запись) | [optional] 
**tickets** | **BuiltList&lt;String&gt;** | Ссылки на файлы с билетами (если записан) | [optional] 
**placesLimit** | **int** | Количество мест (для отладки) | [optional] 
**placesLeft** | **int** | Количество свободных мест (для отладки) | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


