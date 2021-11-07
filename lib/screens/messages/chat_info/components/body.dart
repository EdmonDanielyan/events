import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/participant_with_user.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/bottom_btns.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/data_section.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/header.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/participants.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';

class Body extends StatefulWidget {
  final ChatTable chat;
  final ChatDatabaseCubit chatDatabaseCubit;
  const Body({Key? key, required this.chat, required this.chatDatabaseCubit})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool get isGroup => ChatListView.isGroup(widget.chat);
  late StreamSubscription<List<ParticipantWithUser>> participantsListener;
  List<ParticipantWithUser> participants = [];

  void _listenToParticipants() {
    participantsListener = widget.chatDatabaseCubit.db
        .watchParticipants(widget.chat.id)
        .listen((event) {
      if (this.mounted) {
        setState(() {
          participants = event;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _listenToParticipants();
  }

  @override
  void dispose() {
    super.dispose();
    participantsListener.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChatInfoHeader(
            chat: widget.chat,
            participantsWithUser: participants,
          ),
          divider(),
          SizedBox(height: 25.0),
          divider(),
          ChatInfoDataSection(chat: widget.chat),
          divider(),
          SizedBox(height: 25.0),
          if (isGroup) ...[
            sectionTitleWidget(_strings.participants),
            SizedBox(height: 10.0),
            ChatInfoParticipants(
              chat: widget.chat,
              participants: participants,
            ),
            divider(),
            SizedBox(height: 25.0),
          ],
          divider(),
          ChatInfoBottomBtns(chat: widget.chat),
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
