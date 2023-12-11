import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SubscriptionApi
void main() {
  final instance = Openapi().getSubscriptionApi();

  group(SubscriptionApi, () {
    // Состояние подписки
    //
    // Получить состояние подписки для текущего пользователя. Требует авторизации.
    //
    //Future<UniSubGetStateRespBody> uniSubCancel(String id, { UniSubCancelRequest uniSubCancelRequest }) async
    test('test uniSubCancel', () async {
      // TODO
    });

    // Состояние подписки
    //
    // Получить состояние подписки для текущего пользователя. Требует авторизации.
    //
    //Future<UniSubGetStateRespBody> uniSubGetState(String id) async
    test('test uniSubGetState', () async {
      // TODO
    });

    // Состояние подписки
    //
    // Получить состояние подписки для текущего пользователя. Требует авторизации.
    //
    //Future<UniSubGetStateRespBody> uniSubSubscribe(String id, { UniSubRequest uniSubRequest }) async
    test('test uniSubSubscribe', () async {
      // TODO
    });

  });
}
