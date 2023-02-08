import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/functions/create_opposite_chat.dart';
import 'package:ink_mobile/messenger/functions/show_notification.dart';
import 'package:ink_mobile/messenger/handler/fetch/participant.dart';
import 'package:ink_mobile/messenger/messenger/senders/message/model.dart';
import 'package:ink_mobile/setup.dart';
import 'listener.dart';

@singleton
class DirectMessageListener extends Listener {
  int userId = 0;

  @override
  String get event => SocketEvents.directMessageListener(userId);

  @override
  void handler(data) {
    final model = MessageSenderModel.fromJsonCustom(fromBytes(data));

    if (model != null &&
        model.messages.isNotEmpty &&
        model.messages.first.owner.id != chatsCubit.myId) {
      final chatId = model.messages.first.chatId;

      _createChatIfNotExists(model, chatId);
      _subscribeToChatIfNotExists(chatId);
      getIt<HiddenChatsCubit>().remove(chatId);

      for (final message in model.messages) {
        if (message.owner.id != chatsCubit.myId) {
          chatsCubit.addMessagesToChatById([message], message.chatId);
          //ShowNotification(message).call();
        }
      }

      getIt<CustomDirectMessageListener>().emitTrigger(model);
    }
  }

  void _createChatIfNotExists(MessageSenderModel model, int chatId) {
    final oppositeUser = model.messages.first.owner;
    final me = chatsCubit.me;
    final chat = chatsCubit.singleChatExists([oppositeUser, me]);

    if (chat != null) {
      getIt<CachedUsersCubit>().removeAndAddUser(oppositeUser, oppositeUser.id);
      chatsCubit.updateChatById(
        chat.copyWith(
          id: chatId,
          name: oppositeUser.name,
          ownerId: me.id,
          avatarUrl: oppositeUser.avatarUrl,
          participants: [oppositeUser, me],
          messages: List.from(chat.messages)
            ..map((e) => e.copyWith(chatId: chatId)).toList(),
        ),
        chat.id,
      );
    } else {
      final oppositeChat = CreateOppositeChat(
        chatId,
        model.messages.first.owner,
        chatsCubit.me,
      )();
      chatsCubit.addChats([oppositeChat]);

      FetchPartcipants(oppositeChat.participants).call();
    }
  }

  void _subscribeToChatIfNotExists(int chatId) {
    if (!messengerProvider.isListiningToChat(chatId)) {
      messengerProvider.subscribeToChat(chatId);
    }
  }
}

@singleton
class CustomDirectMessageListener {
  Set<Function(MessageSenderModel)> triggers = {};

  void emitTrigger(MessageSenderModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
