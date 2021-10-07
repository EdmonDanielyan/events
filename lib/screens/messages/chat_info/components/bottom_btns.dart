import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';

class ChatInfoBottomBtns extends StatelessWidget {
  final Chat chat;
  const ChatInfoBottomBtns({Key? key, required this.chat}) : super(key: key);
  static late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          clearChat(),
          Divider(color: Colors.grey, height: 1.0),
          leaveChat(),
        ],
      ),
    );
  }

  Widget clearChat() {
    return textButton(
      onPressed: () {
        print("CLEAR CHAT");
      },
      color: Colors.blue,
      text: "${_strings.clear} ${_strings.chat.toLowerCase()}",
    );
  }

  Widget leaveChat() {
    return textButton(
      onPressed: () {
        print("LEAVE CHAT");
      },
      color: Colors.red,
      text: chat.group != null
          ? "${_strings.leave} ${_strings.chat.toLowerCase()}"
          : "${_strings.delete} ${_strings.chat.toLowerCase()}",
    );
  }

  Widget textButton({
    required void Function()? onPressed,
    required Color color,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ChatInfoDesignEntities.horizontalPadding, vertical: 0.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
