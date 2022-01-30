import 'dart:convert';

import 'package:ink_mobile/messenger/models/texting.dart';


class ChatTextingFields {
  final CustomTexting texting;
  final String chatId;

  ChatTextingFields({
    required this.texting,
    required this.chatId,
  });

  Map<String, String> toMap() {
    return {
      'texting': texting.toJson(),
      'chatId': chatId,
    };
  }

  factory ChatTextingFields.fromMap(Map<String, dynamic> map) {
    return ChatTextingFields(
      texting: CustomTexting.fromJson(map['texting']),
      chatId: map["chatId"],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatTextingFields.fromJson(String source) =>
      ChatTextingFields.fromMap(json.decode(source));
}
