import 'package:ink_mobile/models/chat/database/chat_db.dart';

enum PersonListParamsEnum { SEND_ON }

class PersonListParams {
  final String title;
  final List<MessageTable>? messages;
  final PersonListParamsEnum type;

  PersonListParams({required this.title, this.messages, required this.type});
}
