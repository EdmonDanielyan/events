import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for GlobalApi
void main() {
  final instance = Openapi().getGlobalApi();

  group(GlobalApi, () {
    // Все уведомления
    //
    // Получение полного списка подписок на уведомления по всем источникам
    //
    //Future<NotificationFullList> getAllNotificationsState() async
    test('test getAllNotificationsState', () async {
      // TODO
    });

    // Получить подписку на чат
    //
    // Получение состояния подписки на уведомления о сообщениях в чате
    //
    //Future<NotificationSubState> getNotificationSub(String channel, String targetId) async
    test('test getNotificationSub', () async {
      // TODO
    });

    // Настройки приложения
    //
    //Future<GlobalSettingsResponseBody> getSettings() async
    test('test getSettings', () async {
      // TODO
    });

    // Получить список текстовых фрагментов для использования в интерфейсе.
    //
    //Future<ListSnippetSuccessResponseBody> getSnippetsList() async
    test('test getSnippetsList', () async {
      // TODO
    });

    // Сбросить уведомления
    //
    // Сбросить подписку на уведомления в состояние \"по умолчанию\"
    //
    //Future<NotificationSubState> resetNotificationSub(String channel, String targetId) async
    test('test resetNotificationSub', () async {
      // TODO
    });

    // Изменить подписку на чат
    //
    // Изменить подписку на уведомления о сообщениях в чате
    //
    //Future<NotificationSubState> setNotificationSub(String channel, String targetId, { bool value }) async
    test('test setNotificationSub', () async {
      // TODO
    });

  });
}
