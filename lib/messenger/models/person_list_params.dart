import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

enum PersonListParamsEnum { SEND_ON }

class PersonListParams {
  final String title;
  final List<MessageTable>? messages;
  final PersonListParamsEnum type;

  PersonListParams({required this.title, this.messages, required this.type});
}
