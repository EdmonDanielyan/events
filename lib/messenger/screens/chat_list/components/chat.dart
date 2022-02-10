import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/online/online_bloc.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_date.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_divider.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_message.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_message_trailing.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_name.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/setup.dart';

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

  int? get oppositeUserId =>
      ChatUserViewModel.getOppositeUserIdFromChat(widget.chat);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Dismissible(
        background: const SizedBox(),
        direction: DismissDirection.endToStart,
        secondaryBackground: Icon(Icons.delete, color: Colors.red),
        confirmDismiss: widget.confirmDismiss,
        resizeDuration: null,
        onDismissed: widget.onDismissed,
        key: UniqueKey(),
        child: _chatContainer(),
      ),
    );
  }

  Widget _chatContainer() {
    return InkWell(
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
                _avatarWidget(),
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
                              child: _displayBody(),
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
                              child: _displayEmpty(),
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
                      child: CustomCircleAvatar(url: widget.chat.avatar),
                      opacity: 0.0),
                ),
                SizedBox(width: widget.leadingGap),
                const Expanded(child: ChatDivider())
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    if (oppositeUserId != null) {
      return BlocBuilder<OnlineBloc, OnlineBlocState>(
          bloc: messenger.onlineBloc,
          builder: (context, state) => CustomCircleAvatar(
                url: widget.chat.avatar,
                indicator: state.isOnline(oppositeUserId),
                name: widget.chat.name,
              ));
    }

    return CustomCircleAvatar(
      url: widget.chat.avatar,
      name: widget.chat.name,
    );
  }

  Widget _displayBody() {
    if (lastMessage == null) return const SizedBox();

    final highlightValue = widget.highlightValue.trim();

    return ChatMessage(
      displayName: _getDisplayName(),
      message: widget.searchMessage?.message ?? lastMessage!.message,
      highlightValue: highlightValue,
    );
  }

  Widget _displayEmpty() {
    return ChatMessage(message: localizationInstance.noMessages);
  }

  String? _getDisplayName() {
    if (lastMessage == null) return "";

    if (lastMessage!.type == StoredMessageType.TEXT) {
      if (widget.chat.isGroup() && lastUser != null) {
        return lastUser!.id == JwtPayload.myId
            ? localizationInstance.you
            : lastUser!.name;
      }
    }

    return null;
  }
}
