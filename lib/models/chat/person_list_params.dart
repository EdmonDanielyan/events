import 'package:ink_mobile/models/chat/message.dart';

enum PersonListParamsEnum { SEND_ON }

class PersonListParams {
  final String title;
  final List<Message>? messages;
  final PersonListParamsEnum type;

  PersonListParams({required this.title, this.messages, required this.type});
}
