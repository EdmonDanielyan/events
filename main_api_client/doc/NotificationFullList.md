# openapi.model.NotificationFullList

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**chats** | **BuiltList&lt;bool&gt;** | Список подписок на уведомления определённого типа. Подписки со значением \"по умолчанию\" не выводятся. Ключ - ID истоника уведомлений (напр. чата). Значение - состояние подписки. Значение с ключом \"_default\" - состояние по умолчанию для группы. Для чатов ключи: * просто число - ID группового чата * system - канал уведомлений * число с префиксом u - ID собеседника для приватного  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


