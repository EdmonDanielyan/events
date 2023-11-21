import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ContentApi
void main() {
  final instance = Openapi().getContentApi();

  group(ContentApi, () {
    // Получает полный текст страницы.
    //
    //Future<SinglePageSuccessResponseBody> getPage(String idOrCode) async
    test('test getPage', () async {
      // TODO
    });

    // Получает список страниц с не пустыми сивольными кода. Для отладки.
    //
    //Future<ListPageSuccessResponseBody> getPagesList() async
    test('test getPagesList', () async {
      // TODO
    });

    // Получить список страниц раздела. Например, список страниц для раздела \"социальная ответственность\".
    //
    //Future<SingleSectionSuccessResponseBody> getPagesSection(String code) async
    test('test getPagesSection', () async {
      // TODO
    });

    // Получить список разделов страниц.
    //
    //Future<ListSectionSuccessResponseBody> getPagesSectionsList() async
    test('test getPagesSectionsList', () async {
      // TODO
    });

    // Получить список текстовых фрагментов для использования в интерфейсе.
    //
    //Future<ListSnippetSuccessResponseBody> getSnippetsList() async
    test('test getSnippetsList', () async {
      // TODO
    });

  });
}
