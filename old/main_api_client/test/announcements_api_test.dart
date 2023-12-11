import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AnnouncementsApi
void main() {
  final instance = Openapi().getAnnouncementsApi();

  group(AnnouncementsApi, () {
    // Получить информацию об объявлении по ID
    //
    // Получить информацию о конкретном объявлении по ID
    //
    //Future<GetAnnouncementById> getAnnouncementById(int id) async
    test('test getAnnouncementById', () async {
      // TODO
    });

    // Получение списка событий
    //
    // Получение списка событий по убыванию даты создания с пагинацией
    //
    //Future<GetAnnouncements> getAnnouncements({ int pageNumber, int countOnPage }) async
    test('test getAnnouncements', () async {
      // TODO
    });

  });
}
