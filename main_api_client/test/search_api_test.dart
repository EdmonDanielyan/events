import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SearchApi
void main() {
  final instance = Openapi().getSearchApi();

  group(SearchApi, () {
    // Метод поиска по сотрудниками, объявлениям, событиям, новостям
    //
    //Future<GetSearchSuccess> searchGet({ String query }) async
    test('test searchGet', () async {
      // TODO
    });

  });
}
