import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/participant_with_user.dart';
import 'package:ink_mobile/screens/messages/chat_info/chat_info_screen.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInfoHeader extends StatelessWidget {
  final ChatTable chat;
  final List<ParticipantWithUser> participantsWithUser;
  const ChatInfoHeader(
      {Key? key, required this.chat, required this.participantsWithUser})
      : super(key: key);

  static late ChatDatabaseCubit _chatDatabaseCubit;
  static late AppLocalizations _strings;

  bool get isGroup => ChatListView.isGroup(chat);
  int get countParticipants => participantsWithUser.length;

  String participantsLable() {
    if (countParticipants == 1)
      return _strings.participant;
    else
      return _strings.participantsAccusative;
  }

  @override
  Widget build(BuildContext context) {
    _chatDatabaseCubit = ChatInfoScreen.of(context).chatDatabaseCubit;
    _strings = localizationInstance;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: ChatInfoDesignEntities.horizontalPadding, vertical: 20.0),
      child: StreamBuilder<ChatTable>(
        stream: _chatDatabaseCubit.db.watchChatById(chat.id),
        builder: (context, state) {
          var newChat = chat;
          if (state.hasData && state.data != null) {
            newChat = state.data!;
          }

          return Row(
            crossAxisAlignment:
                isGroup ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              CustomCircleAvatar(
                url: newChat.avatar,
                name: newChat.name,
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nameWidget(newChat.name),
                    if (isGroup && chat.description.isNotEmpty) ...[
                      SizedBox(height: 3.0),
                      descriptionWidget(newChat.description),
                    ],
                    if (isGroup) ...[
                      SizedBox(height: 3.0),
                      countParticipantsWidget(),
                    ]
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget nameWidget(String name) {
    return Text(
      name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 21.0,
      ),
      maxLines: 1,
    );
  }

  Widget descriptionWidget(String description) {
    return Text(
      description,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13.0,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget countParticipantsWidget() {
    return Text(
      "$countParticipants ${participantsLable().toLowerCase()}",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13.0,
      ),
    );
  }
}
