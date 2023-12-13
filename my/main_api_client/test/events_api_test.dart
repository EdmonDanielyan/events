import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for EventsApi
void main() {
  final instance = Openapi().getEventsApi();

  group(EventsApi, () {
    // Добавить текущего пользователя как участника события
    //
    //Future<AddEventMember> eventsAddeventmemberIdGet(int id) async
    test('test eventsAddeventmemberIdGet', () async {
      // TODO
    });

    // Удалить текущего пользователя как участника события
    //
    //Future<AddEventMember> eventsRemoveeventmemberIdGet(int id) async
    test('test eventsRemoveeventmemberIdGet', () async {
      // TODO
    });

    // Получить информацию о событии по ID
    //
    // Получить информацию о конкретном событии по ID
    //
    //Future<GetEventById> getEventById(int id) async
    test('test getEventById', () async {
      // TODO
    });

    // Метод получения событий
    //
    // Получить информацию о событиях
    //
    //Future<GetEvents> getEvents({ int pageNumber, int countOnPage }) async
    test('test getEvents', () async {
      // TODO
    });

  });
}
