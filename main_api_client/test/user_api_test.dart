import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for UserApi
void main() {
  final instance = Openapi().getUserApi();

  group(UserApi, () {
    // Получение ключей шифрования текущего пользователя
    //
    //Future<GetKeysSuccess> keysGet() async
    test('test keysGet', () async {
      // TODO
    });

    // Получение публичного ключа другого пользователя
    //
    //Future<GetPubKeySuccess> keysIdGet(int id) async
    test('test keysIdGet', () async {
      // TODO
    });

    //Future<BirthdaysSuccess> userBirthdayGet() async
    test('test userBirthdayGet', () async {
      // TODO
    });

    // Метод для получения информации может ли пользователь оставлять заявки на справки
    //
    //Future<CanInquire> userCaninquireGet() async
    test('test userCaninquireGet', () async {
      // TODO
    });

    // Получение информации о текущем пользователе
    //
    //Future<GetUserSuccess> userGet() async
    test('test userGet', () async {
      // TODO
    });

    // Возвращает тэги для формы обратной связи
    //
    //Future<FeedbackTagsList> userGetfeedbacktagsGet() async
    test('test userGetfeedbacktagsGet', () async {
      // TODO
    });

    // Возвращает вопросы (обратная связь)
    //
    //Future<QuestionsList> userGetquestionsGet({ int pageNumber, int countOnPage }) async
    test('test userGetquestionsGet', () async {
      // TODO
    });

    // Автозаполняемые поля для формы справок
    //
    //Future<ReferenceAutoFill> userGetreferenceautofillGet() async
    test('test userGetreferenceautofillGet', () async {
      // TODO
    });

    // Получение информации о пользователе по ID
    //
    //Future<GetUserSuccess> userIdGet(int id) async
    test('test userIdGet', () async {
      // TODO
    });

    // Получение информации о кадровых перемещениях текущего пользователя
    //
    //Future<MovementsSuccess> userMovementsGet() async
    test('test userMovementsGet', () async {
      // TODO
    });

    // Метод для заказа ДМС
    //
    //Future<OrderDMSSuccess> userOrderdmsPost({ OrderDMS orderDMS }) async
    test('test userOrderdmsPost', () async {
      // TODO
    });

    // Метод для заказа справок
    //
    //Future<OrderReferenceSuccess> userOrderreferencePost(String referenceType, String phone, String way, { String postalCode, String address, String period, String destination, int num_, String child, String dateStart, String dateEnd, BuiltList<MultipartFile> filesLeftSquareBracketRightSquareBracket }) async
    test('test userOrderreferencePost', () async {
      // TODO
    });

    // Метод для заказа транспорта
    //
    //Future<OrderTransportSuccess> userOrdertransportPost(String fio, String phone, int status, String date, String time, String place, String howLong, String passengers, String route, { BuiltList<MultipartFile> filesLeftSquareBracketRightSquareBracket }) async
    test('test userOrdertransportPost', () async {
      // TODO
    });

    // Возвращает вспомогательные данные для формы заказа транспорта
    //
    //Future<GetReferenceOrderForm> userReferenceorderformGet() async
    test('test userReferenceorderformGet', () async {
      // TODO
    });

    // Метод для отправки обратной связи (вопроса руководству)
    //
    //Future<SendFeedbackSuccess> userSendfeedbackPost(String question, String tags, { String fio, String contacts, BuiltList<MultipartFile> filesLeftSquareBracketRightSquareBracket }) async
    test('test userSendfeedbackPost', () async {
      // TODO
    });

    // Возвращает вспомогательные данные для формы заказа транспорта
    //
    //Future<GetTransportOrderForm> userTranspontorderformGet() async
    test('test userTranspontorderformGet', () async {
      // TODO
    });

    // Получение информации о пользователях
    //
    //Future<GetUsersSuccess> usersPost({ GetUsers getUsers }) async
    test('test usersPost', () async {
      // TODO
    });

  });
}
