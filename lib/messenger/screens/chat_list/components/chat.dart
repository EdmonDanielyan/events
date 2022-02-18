import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/components/dismissible/custom_dismissible.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_body.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_date.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_divider.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_message.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_message_trailing.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_name.dart';
import 'package:ink_mobile/setup.dart';

import 'avatar.dart';

class ChatListTile extends StatefulWidget {
  final String highlightValue;
  final EdgeInsetsGeometry? contentPadding;
  final int index;
  final ChatTable chat;
  final double leadingGap;
  final List<MessageWithUser> messagesWithUser;
  final ChatDatabaseCubit chatDatabaseCubit;
  final MessageTable? searchMessage;
  final void Function()? onTap;
  final void Function(DismissDirection)? onDismissed;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;

  const ChatListTile(
      {Key? key,
      this.highlightValue = "",
      required this.index,
      required this.chat,
      required this.messagesWithUser,
      required this.chatDatabaseCubit,
      this.searchMessage,
      this.contentPadding,
      this.leadingGap = 15.0,
      this.onTap,
      this.onDismissed,
      this.confirmDismiss})
      : super(key: key);

  @override
  State<ChatListTile> createState() => _ChatListTileState();
}

class _ChatListTileState extends State<ChatListTile> {
  bool get hasMessage => widget.messagesWithUser.isNotEmpty;

  MessageTable? get lastMessage => widget.messagesWithUser.last.message;

  UserTable? get lastUser => widget.messagesWithUser.last.user;

  final Messenger messenger = sl<Messenger>();

  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
      confirmDismiss: widget.confirmDismiss,
      onDismissed: widget.onDismissed,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: widget.contentPadding,
          margin: EdgeInsets.only(bottom: 7.0, top: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChatListAvatar(
                      onlineBloc: messenger.onlineBloc, chat: widget.chat),
                  SizedBox(width: widget.leadingGap),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ChatName(
                                name: widget.chat.name,
                                highlightValue: widget.highlightValue,
                              ),
                            ),
                            SizedBox(width: 2.0),
                            if (hasMessage) ...[
                              ChatDate(
                                chatDate:
                                    lastMessage?.timestamp ?? DateTime.now(),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (hasMessage) ...[
                              Expanded(
                                child: ChatListBody(
                                  chat: widget.chat,
                                  lastMessage: lastMessage,
                                  searchMessage: widget.searchMessage,
                                  lastUser: lastUser,
                                  highlightValue: widget.highlightValue,
                                ),
                              ),
                              if (widget.messagesWithUser.length > 0) ...[
                                ChatMessageTrailing(
                                    showUnread:
                                        widget.chat.unreadCounterOn ?? true,
                                    messagesWithUser: widget.messagesWithUser),
                              ],
                            ],
                            if (!hasMessage) ...[
                              Expanded(
                                child: ChatMessage(
                                    message: localizationInstance.noMessages),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 0.0,
                    child: Opacity(
                        child: CachedCircleAvatar(url: widget.chat.avatar),
                        opacity: 0.0),
                  ),
                  SizedBox(width: widget.leadingGap),
                  const Expanded(child: ChatDivider())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
