import 'package:flutter/material.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_date.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_divider.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message_trailing.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_name.dart';
import 'package:ink_mobile/setup.dart';

class ChatListTile extends StatefulWidget {
  final String highlightValue;
  final EdgeInsetsGeometry? contentPadding;
  final int index;
  final ChatTable chat;
  final double leadingGap;
  final List<MessageWithUser> messagesWithUser;
  final ChatDatabaseCubit chatDatabaseCubit;
  final void Function()? onTap;
  final void Function(DismissDirection)? onDismissed;
  const ChatListTile({
    Key? key,
    this.highlightValue = "",
    required this.index,
    required this.chat,
    required this.messagesWithUser,
    required this.chatDatabaseCubit,
    this.contentPadding,
    this.leadingGap = 15.0,
    this.onTap,
    this.onDismissed,
  }) : super(key: key);

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
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _listenToUserSub();
    });
  }

  Future<void> _listenToUserSub() async {
    if (oppositeUserId != null) {
      final watchUser = widget.chatDatabaseCubit.db.watchUser(oppositeUserId!);

      watchUser.first.then((user) async {
        if (user != null && messenger.isConnected) {
          await messenger.subscribeToUserOnline(user);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Dismissible(
        background: SizedBox(),
        direction: DismissDirection.endToStart,
        secondaryBackground: Icon(Icons.delete, color: Colors.red),
        resizeDuration: null,
        onDismissed: widget.onDismissed,
        key: UniqueKey(),
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
                                    chatDate: lastMessage?.created ??
                                        new DateTime.now()),
                              ],
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (hasMessage) ...[
                                Expanded(
                                  child: _displayBody(),
                                ),
                                if (widget.messagesWithUser.length > 0) ...[
                                  ChatMessageTrailing(
                                      messagesWithUser:
                                          widget.messagesWithUser),
                                ],
                              ],
                              if (!hasMessage) ...[
                                Expanded(
                                  child: _displayEmpty(),
                                ),
                              ],
                            ],
                          ),
                          SizedBox(height: 10.0)
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
                    Expanded(child: ChatDivider())
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    if (oppositeUserId != null) {
      return StreamBuilder(
        stream: widget.chatDatabaseCubit.db.watchUser(oppositeUserId!),
        builder: (context, AsyncSnapshot<UserTable?> snapshot) {
          bool indicator = false;
          if (snapshot.hasData && snapshot.data != null) {
            UserTable user = snapshot.data!;
            indicator = user.online;
          }
          return CustomCircleAvatar(
            url: widget.chat.avatar,
            indicator: indicator,
            name: widget.chat.name,
          );
        },
      );
    }

    return CustomCircleAvatar(
      url: widget.chat.avatar,
      name: widget.chat.name,
    );
  }

  Widget _displayBody() {
    if (lastMessage == null) return const SizedBox();

    return ChatMessage(
        displayName: _getDisplayName(), message: lastMessage!.message);
  }

  Widget _displayEmpty() {
    return ChatMessage(message: localizationInstance.noMessages);
  }

  String? _getDisplayName() {
    if (lastMessage == null) return "";

    if (lastMessage!.type == MessageType.Text) {
      if (ChatListView.isGroup(widget.chat) && lastUser != null) {
        return lastUser!.id == JwtPayload.myId
            ? localizationInstance.you
            : lastUser!.name;
      }
    }

    return null;
  }
}
