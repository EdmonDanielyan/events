import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_info/chat_info_screen.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInfoHeader extends StatelessWidget {
  final ChatTable chat;
  const ChatInfoHeader({Key? key, required this.chat}) : super(key: key);

  static late ChatDatabaseCubit _chatDatabaseCubit;
  static late AppLocalizations _strings;

  bool get isGroup => ChatListView.isGroup(chat);
  int get countParticipants => 1;

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
      child: Row(
        crossAxisAlignment:
            isGroup ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          CustomCircleAvatar(url: chat.avatar),
          SizedBox(width: 20.0),
          Expanded(
            child: BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
              bloc: _chatDatabaseCubit,
              builder: (context, state) {
                final chat = state.selectedChat;
                if (chat != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nameWidget(chat.name),
                      if (isGroup && chat.description.isNotEmpty) ...[
                        SizedBox(height: 3.0),
                        descriptionWidget(chat.description),
                      ],
                      if (isGroup) ...[
                        SizedBox(height: 3.0),
                        countUsersWidget(),
                      ]
                    ],
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
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

  Widget countUsersWidget() {
    return Text(
      "$countParticipants ${participantsLable().toLowerCase()}",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13.0,
      ),
    );
  }
}
