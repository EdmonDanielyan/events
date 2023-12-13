import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ContactsApi
void main() {
  final instance = Openapi().getContactsApi();

  group(ContactsApi, () {
    // Получение контактов
    //
    // Получение контактов (пользователей) в поиске мессенджера по введенной строке. Совпадение проверяется по ФИО без учета ошибок.
    //
    //Future<GetContacts> getContacts({ String search, int pageNumber, int countOnPage }) async
    test('test getContacts', () async {
      // TODO
    });

  });
}
