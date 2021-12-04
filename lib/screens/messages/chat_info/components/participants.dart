import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/constants/codes.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/participant_with_user.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/btn_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/participant_card.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/entities/new_chat_screen_params.dart';

import '../chat_info_screen.dart';

class ChatInfoParticipants extends StatelessWidget {
  final ChatTable chat;
  final List<ParticipantWithUser> participants;
  const ChatInfoParticipants(
      {Key? key, required this.chat, required this.participants})
      : super(key: key);
  static late AppLocalizations _strings;
  static late ChatDatabaseCubit _chatDatabaseCubit;
  static late SelectableCubit<UserTable> _selectableCubit;

  bool get iAmOwner => ChatListView.isOwner(chat);

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _chatDatabaseCubit = ChatInfoScreen.of(context).chatDatabaseCubit;
    _selectableCubit = ChatInfoScreen.of(context).selectableCubit;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iAmOwner) ...[
            addUserWidget(context),
            divider(),
          ],
          userListWidget(context),
        ],
      ),
    );
  }

  NewChatScreenParams _getNewChatScreenParams() {
    return NewChatScreenParams(
      title: _strings.add,
      chosenOneText: _strings.add,
      chosenMultipleText: _strings.add,
      hideIds: ParticipantWithUserListView.getUserIds(participants),
      onSubmit: _onSubmit,
    );
  }

  void _onSubmit(BuildContext context) async {
    List<UserTable> selectedUsers = _selectableCubit.getItems;
    List<UserTable> userParticipants =
        ParticipantWithUserListView.getUsers(participants);
    if (UseMessageProvider.initialized) {
      UseMessageProvider.messageProvider?.inviteSender
          .sendInvitations(chat, userParticipants..addAll(selectedUsers));
      UseMessageProvider.messageProvider?.chatEventsSender
          .sendUserChatJoinedMessage(chat, selectedUsers);
    }
    Navigator.of(context).pop();
  }

  Widget addUserWidget(BuildContext context) {
    return ChatInfoBtnWrapper(
      onTap: () => CustomBottomSheet(
        context: context,
        child: NewChatScreen(
          newChatScreenParams: _getNewChatScreenParams(),
          chatDatabaseCubit: _chatDatabaseCubit,
          selectableCubit: _selectableCubit,
          chatPersonListCubit: ChatInfoScreen.of(context).chatPersonListCubit,
        ),
      ),
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
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed("/personal",
                      arguments: {
                        'id': user.id,
                        HIDE_BOTTOM_NAV_BAR_CODE: true
                      }),
                  child: ParticipantCard(
                    user: user,
                    trailingLable: ChatListView.isOwner(chat, myId: user.id)
                        ? _strings.owner
                        : "",
                  ),
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
