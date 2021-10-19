import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/chat/person_list_params.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessageFunctions {
  final BuildContext context;
  final AppLocalizations? strings;
  MessageFunctions({required this.context, this.strings});

  void sendOn(List<Message> messages) {
    Future.delayed(Duration(milliseconds: 200), () {
      Navigator.of(context).pushNamed(
        "/message_person_list",
        arguments: PersonListParams(
          messages: messages,
          title: strings != null ? strings!.sendOn : "",
          type: PersonListParamsEnum.SEND_ON,
        ),
      );
    });
  }
}
