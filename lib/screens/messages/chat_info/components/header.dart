import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/group_chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';

class ChatInfoHeader extends StatelessWidget {
  final Chat chat;
  const ChatInfoHeader({Key? key, required this.chat}) : super(key: key);

  static late LanguageStrings _strings;

  bool get isGroup => chat.group != null;
  GroupChat get group => chat.group!;

  String participantsLable() {
    if (group.users.length == 1)
      return _strings.participant;
    else
      return _strings.participantsAccusative;
  }

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: ChatInfoDesignEntities.horizontalPadding, vertical: 20.0),
      child: Row(
        crossAxisAlignment:
            isGroup ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          CustomCircleAvatar(url: chat.avatarUrl),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameWidget(),
                if (isGroup && group.description.isNotEmpty) ...[
                  SizedBox(height: 3.0),
                  descriptionWidget(),
                ],
                if (isGroup) ...[
                  SizedBox(height: 3.0),
                  countUsersWidget(),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget nameWidget() {
    return Text(
      chat.chatName,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 21.0,
      ),
      maxLines: 1,
    );
  }

  Widget descriptionWidget() {
    return Text(
      group.description,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13.0,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget countUsersWidget() {
    return Text(
      "${group.users.length} ${participantsLable().toLowerCase()}",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13.0,
      ),
    );
  }
}
