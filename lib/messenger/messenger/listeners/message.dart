import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/messenger/senders/message/model.dart';
import 'package:ink_mobile/setup.dart';

import 'listener.dart';

class MessageListener extends Listener {
  final int chatId;
  MessageListener(this.chatId);

  @override
  String get event => SocketEvents.messageListener(chatId);

  @override
  void handler(data) {
    final model = MessageSenderModel.fromJsonCustom(fromBytes(data));

    if (model != null && messengerProvider.isListiningToChat(chatId)) {
      if (model.messages.isNotEmpty) {
        for (final message in model.messages) {
          if (message.owner.id != chatsCubit.myId) {
            chatsCubit.addMessagesToChatById([message], message.chatId);
            //ShowNotification(message).call();
          }
        }
      }

      getIt<CustomMessageListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomMessageListener {
  Set<Function(MessageSenderModel)> triggers = {};

  void emitTrigger(MessageSenderModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
