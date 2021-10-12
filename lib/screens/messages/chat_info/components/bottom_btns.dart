import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';

class ChatInfoBottomBtns extends StatelessWidget {
  final Chat chat;
  const ChatInfoBottomBtns({Key? key, required this.chat}) : super(key: key);
  static late LanguageStrings _strings;
  static late ChatCubit _chatCubit;
  static late ChatListCubit _chatListCubit;

  bool get isGroup => chat.group != null;

  void _clearMessages() {
    _chatCubit.clearMessages();
    _chatListCubit.updateMessages([]);
  }

  void _deleteChat(BuildContext context) {
    _chatListCubit.deleteCurrentChat();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    _chatListCubit = BlocProvider.of<ChatListCubit>(context);

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (chat.messages.length > 0) ...[
            clearChat(),
            Divider(color: Colors.grey, height: 1.0),
          ],
          leaveChat(context),
        ],
      ),
    );
  }

  Widget clearChat() {
    return textButton(
      onPressed: _clearMessages,
      color: Colors.blue,
      text: "${_strings.clear} ${_strings.chat.toLowerCase()}",
    );
  }

  Widget leaveChat(BuildContext context) {
    return textButton(
      onPressed: () => _deleteChat(context),
      color: Colors.red,
      text: isGroup
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
