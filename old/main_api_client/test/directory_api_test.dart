import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DirectoryApi
void main() {
  final instance = Openapi().getDirectoryApi();

  group(DirectoryApi, () {
    // Справочник организаций
    //
    // Получение полного справочника организаций для использования в формах
    //
    //Future<OrganisationDirectoryResponseBody> getOrganisationDirectory() async
    test('test getOrganisationDirectory', () async {
      // TODO
    });

  });
}
