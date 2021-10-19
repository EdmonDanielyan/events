import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/group_chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/btn_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/participant_card.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';

class ChatInfoParticipants extends StatelessWidget {
  final Chat chat;
  const ChatInfoParticipants({Key? key, required this.chat}) : super(key: key);
  static late AppLocalizations _strings;

  GroupChat get group => chat.group!;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addUserWidget(),
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
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeTop: true,
      child: ListView.builder(
        itemCount: group.users.length,
        shrinkWrap: true,
        controller: ScrollController(keepScrollOffset: false),
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            ParticipantCard(
              user: group.users[index],
              owner: group.owner,
              admins: group.admins,
            ),
            if (index != group.users.length - 1) ...[
              divider(),
            ],
          ],
        ),
      ),
    );
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
