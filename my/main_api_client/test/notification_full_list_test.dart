import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for NotificationFullList
void main() {
  final instance = NotificationFullListBuilder();
  // TODO add properties to the builder and call build()

  group(NotificationFullList, () {
    // Список подписок на уведомления определённого типа. Подписки со значением \"по умолчанию\" не выводятся. Ключ - ID истоника уведомлений (напр. чата). Значение - состояние подписки. Значение с ключом \"_default\" - состояние по умолчанию для группы. Для чатов ключи: * просто число - ID группового чата * system - канал уведомлений * число с префиксом u - ID собеседника для приватного 
    // BuiltList<bool> chats
    test('to test the property `chats`', () async {
      // TODO
    });

  });
}
