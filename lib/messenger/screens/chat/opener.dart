import 'package:flutter/material.dart';
import 'package:ink_mobile/components/alert/alert_cancel.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/handler/senders/delete_messages_sender_handler.dart';
import 'package:ink_mobile/messenger/handler/senders/read_messages_sender_handler%20copy.dart';
import 'package:ink_mobile/messenger/handler/senders/send_message_handler.dart';
import 'package:ink_mobile/messenger/handler/senders/update_message_sender_handler.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/screens/chat_info/opener.dart';

import 'chat_screen.dart';

class ChatScreenOpener {
  final BuildContext context;
  final int chatId;
  final CachedChatsCubit cachedChatsCubit;
  final OnlineCubit onlineCubit;
  final CachedUsersCubit cachedUsersCubit;
  const ChatScreenOpener(
    this.context,
    this.chatId,
    this.cachedChatsCubit, {
    required this.onlineCubit,
    required this.cachedUsersCubit,
  });

  void call() {
    FocusManager.instance.primaryFocus?.unfocus();
    cachedChatsCubit.selectChatById(chatId);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          cachedChatsCubit: cachedChatsCubit,
          onMessageSend: _onMessageSend,
          onAppBarClicked: (context, chat) => ChatInfoOpener(
            context,
            cachedChatsCubit,
            onlineCubit,
            cachedUsersCubit: cachedUsersCubit,
          )(),
          onMessageDelete: _onMessageDelete,
          onMessageEdit: _onMessageEdit,
          readMessage: _readMessages,
          cachedUsersCubit: cachedUsersCubit,
          onlineCubit: onlineCubit,
        ),
      ),
    );
  }

  void _onMessageSend(Message message, Chat chat) {
    cachedChatsCubit.addMessagesToChatById([message], chat.id);
    SendMessageHandler([message], chat).call();
  }

  void _onMessageDelete(
      BuildContext context, List<Message> messages, Chat chat) {
    if (messages.length == 1) {
      Future.delayed(Duration(milliseconds: 200), () {
        CustomAlertCancel(
          context,
          title: localizationInstance.delete,
          body: localizationInstance.messageDeleteHint,
          submitTxt: localizationInstance.delete,
          onSubmit: () {
            Navigator.of(context).pop();
            DeleteMessagesSenderHandler(
                    messages, cachedChatsCubit.myId, chat.id)
                .call();
          },
        ).call();
      });
    } else {
      DeleteMessagesSenderHandler(messages, cachedChatsCubit.myId, chat.id)
          .call();
    }
  }

  void _onMessageEdit(Message message, Chat chat) {
    UpdateMessageSenderHandler(message, cachedChatsCubit.myId).call();
  }

  void _readMessages(Message lastReadMessage) {
    ReadMessagesSenderHandler(lastReadMessage, cachedChatsCubit.myId).call();
  }
}
