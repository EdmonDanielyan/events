import 'package:ink_mobile/messenger/api/services/message/send.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/messenger/senders/direct_message/message.dart';
import 'package:ink_mobile/messenger/messenger/senders/direct_message/model.dart';
import 'package:ink_mobile/messenger/messenger/senders/message/message.dart';
import 'package:ink_mobile/messenger/messenger/senders/message/model.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/setup.dart';

class SendMessageHandler {
  final List<Message> messages;
  final Chat chat;
  const SendMessageHandler(this.messages, this.chat);

  Future<void> call() async {
    final chatsCubit = getIt<CachedChatsCubit>();

    if (messages.isNotEmpty) {
      for (final message in messages) {
        await SendMessageService(
          message,
          myId: chatsCubit.myId,
          successCallback: (msg, token) {
            final newMsg = message.copyWith(
              id: msg.id,
              status: MessageStatus.sent,
              updatedAt: msg.updatedAt,
              createdAt: msg.createdAt,
            );
            chatsCubit.updateMessage(
              newMsg,
              message.id,
              message.chatId,
            );

            if (chat.isSingle) {
              DirectMessageSender(DirectMessageSenderModel(
                messages: [newMsg],
                toUser: chat.getFirstNotMyId(chatsCubit.myId),
                token: token,
              )).call();
            } else {
              MessageSender(MessageSenderModel(
                messages: [newMsg],
                token: token,
              )).call();
            }
          },
          errorCallback: (err) {
            chatsCubit.updateMessage(
              message.copyWith(status: MessageStatus.error),
              message.id,
              message.chatId,
            );
          },
        ).call();
      }
    }
  }
}
