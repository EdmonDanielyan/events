import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_state.dart';
import 'package:ink_mobile/messenger/cases/open_chat.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/chat_screen_params.dart';
import 'package:ink_mobile/messenger/screens/chat_info/components/btn_wrapper.dart';
import 'package:ink_mobile/messenger/screens/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_count.dart';
import 'package:ink_mobile/setup.dart';

class ChatInfoDataSection extends StatelessWidget {
  final ChatTable chat;

  ChatInfoDataSection({Key? key, required this.chat}) : super(key: key);

  static late AppLocalizations _strings;
  final Messenger messenger = sl<Messenger>();

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // linksButton(context),
          // SizedBox(height: 5.0),
          // divider(),
          // SizedBox(height: 5.0),
          notificationBtnWidget(),
          divider(),
          unreadCounterBtnWidget(),
        ],
      ),
    );
  }

  Widget linksButton(BuildContext context) {
    final title = _strings.links;
    return ChatInfoBtnWrapper(
      onTap: () {
        OpenChat(messenger.chatDatabaseCubit, chat).call(
          chatScreenParams: ChatScreenParamsListView.onlyFiles(title),
        );
      },
      icon: filesIcon(),
      children: [
        Text(
          title,
          maxLines: 1,
        ),
      ],
    );
  }

  Widget divider() {
    return Container(
      padding: EdgeInsets.only(
        left: ChatInfoDesignEntities.horizontalPadding,
      ),
      child: Row(
        children: [
          SizedBox(height: 0.0, child: filesIcon()),
          SizedBox(width: ChatInfoDesignEntities.titleGap),
          Expanded(child: Divider(color: Colors.grey, height: 1.0)),
        ],
      ),
    );
  }

  Widget notificationBtnWidget() {
    return BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
      bloc: messenger.chatDatabaseCubit,
      builder: (context, state) {
        if (state.selectedChat == null) return SizedBox();

        final selectedChat = state.selectedChat!;
        var str = _strings.turnOff;
        var icon = Icons.volume_off_rounded;

        if (!(selectedChat.notificationsOn ?? true)) {
          str = _strings.turnOn;
          icon = Icons.volume_up_rounded;
        }

        return ChatInfoBtnWrapper(
          onTap: () {
            final chat = selectedChat.copyWith(
                notificationsOn: !(selectedChat.notificationsOn ?? true));
            messenger.chatFunctions.updateChat(chat, setSelectedChat: true);
          },
          icon: Container(
            padding: const EdgeInsets.all(2.0),
            color: Colors.red,
            child: Icon(
              icon,
              color: Colors.white,
              size: ChatInfoDesignEntities.iconSize,
            ),
          ),
          children: [
            Text(
              "$str ${_strings.notifications.toLowerCase()}",
              maxLines: 1,
            ),
          ],
        );
      },
    );
  }

  Widget unreadCounterBtnWidget() {
    return BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
      bloc: messenger.chatDatabaseCubit,
      builder: (context, state) {
        if (state.selectedChat == null) return SizedBox();

        final selectedChat = state.selectedChat!;
        var str = _strings.turnOff;

        if (!(selectedChat.unreadCounterOn ?? true)) {
          str = _strings.turnOn;
        }

        return ChatInfoBtnWrapper(
          onTap: () {
            final chat = selectedChat.copyWith(
                updatedAt: DateTime.now(),
                unreadCounterOn: !(selectedChat.unreadCounterOn ?? true));
            messenger.chatFunctions.updateChat(chat, setSelectedChat: true);
          },
          //Можно было бы найти иконку по стилю каунтера
          icon: SizedBox(
              height: 32,
              width: 32,
              child: Stack(children: [
                Center(
                    child: Container(
                        width: 32,
                        height: 2,
                        color: Colors.white,
                        transform: Matrix4.skewY(0.0)
                          ..rotateX(pi)
                          ..rotateZ(pi * 0.8))),
                Center(child: const ChatCount(count: 0))
              ])),
          children: [
            Text(
              "$str ${_strings.unreadCounter}",
              maxLines: 1,
            ),
          ],
        );
      },
    );
  }

  Widget filesIcon() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      color: Colors.green[900],
      child: Icon(
        Icons.file_present,
        color: Colors.white,
        size: ChatInfoDesignEntities.iconSize,
      ),
    );
  }
}