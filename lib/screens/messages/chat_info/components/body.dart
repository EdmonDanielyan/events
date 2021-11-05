import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/bottom_btns.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/data_section.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/header.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/participants.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';

class Body extends StatelessWidget {
  final ChatTable chat;
  const Body({Key? key, required this.chat}) : super(key: key);

  bool get isGroup => ChatListView.isGroup(chat);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChatInfoHeader(chat: chat),
          divider(),
          SizedBox(height: 25.0),
          divider(),
          ChatInfoDataSection(),
          divider(),
          SizedBox(height: 25.0),
          if (isGroup) ...[
            sectionTitleWidget(_strings.participants),
            SizedBox(height: 10.0),
            ChatInfoParticipants(chat: chat),
            divider(),
            SizedBox(height: 25.0),
          ],
          divider(),
          ChatInfoBottomBtns(chat: chat),
          divider(),
        ],
      ),
    );
  }

  Widget sectionTitleWidget(String txt) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ChatInfoDesignEntities.horizontalPadding),
      child: Text(
        txt.toUpperCase(),
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(color: Colors.grey, height: 2.0);
  }
}
