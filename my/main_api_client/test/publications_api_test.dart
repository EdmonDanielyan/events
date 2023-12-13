import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PublicationsApi
void main() {
  final instance = Openapi().getPublicationsApi();

  group(PublicationsApi, () {
    // ИНК-Знание - Публикации
    //
    //Future<GetPublications> publicationsGet({ int pageNumber, int countOnPage }) async
    test('test publicationsGet', () async {
      // TODO
    });

  });
}
