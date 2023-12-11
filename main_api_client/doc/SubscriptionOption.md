# openapi.model.SubscriptionOption

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | IВ | [optional] 
**title** | **String** | Заголовок | [optional] 
**description** | **String** | Описание | [optional] 
**image** | **String** | Картинка | [optional] 
**limit** | **int** | Мест всего (null - не ограниченно) | [optional] 
**left** | **int** | Мест осталось (null - не ограниченно) | [optional] 
**dateStart** | [**DateTime**](DateTime.md) | Дата и время начала (для режима календаря) | [optional] 
**dateEnd** | [**DateTime**](DateTime.md) | Дата и время окончания (для режима календаря) | [optional] 
**available** | **bool** | Доступно для выбора. Если null - считать как true. Если false - отобразить, но не давать выбрать. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


