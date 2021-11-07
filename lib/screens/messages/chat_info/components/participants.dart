import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/participant_with_user.dart';
import 'package:ink_mobile/screens/messages/chat_info/chat_info_screen.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/btn_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/participant_card.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';

class ChatInfoParticipants extends StatelessWidget {
  final ChatTable chat;
  final List<ParticipantWithUser> participants;
  const ChatInfoParticipants(
      {Key? key, required this.chat, required this.participants})
      : super(key: key);
  static late AppLocalizations _strings;

  bool get iAmOwner => ChatListView.isOwner(chat);

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iAmOwner) ...[
            addUserWidget(),
          ],
          divider(),
          userListWidget(context),
        ],
      ),
    );
  }

  Widget addUserWidget() {
    return ChatInfoBtnWrapper(
      onTap: () {
        print("ADD USER");
      },
      icon: addUserIcon(),
      children: [
        Text(
          "${_strings.add} ${_strings.participantsAccusative.toLowerCase()}",
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  Widget userListWidget(BuildContext context) {
    if (participants.isNotEmpty) {
      return MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: ListView.builder(
          itemCount: participants.length,
          shrinkWrap: true,
          controller: ScrollController(keepScrollOffset: false),
          itemBuilder: (BuildContext context, int index) {
            final user = participants[index].user;
            if (user == null) return SizedBox();
            return Column(
              children: [
                ParticipantCard(
                  user: user,
                  trailingLable: ChatListView.isOwner(chat, myId: user.id)
                      ? _strings.owner
                      : "",
                ),
                if (index != participants.length - 1) ...[
                  divider(),
                ],
              ],
            );
          },
        ),
      );
    }

    return SizedBox();
  }

  Widget addUserIcon() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      color: Colors.blue,
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: ChatInfoDesignEntities.iconSize,
      ),
    );
  }

  Widget divider() {
    return Container(
      padding: EdgeInsets.only(left: ChatInfoDesignEntities.horizontalPadding),
      child: Row(
        children: [
          SizedBox(
              width: ChatInfoDesignEntities.titleGap +
                  ChatInfoDesignEntities.iconSize),
          Expanded(child: Divider(color: Colors.grey, height: 11.0)),
        ],
      ),
    );
  }
}
