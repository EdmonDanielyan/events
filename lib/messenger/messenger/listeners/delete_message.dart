import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/handler/remove_messages.dart';
import 'package:ink_mobile/messenger/messenger/senders/delete_message/model.dart';
import 'package:ink_mobile/setup.dart';

import 'listener.dart';

class DeleteMessageListener extends Listener {
  final int chatId;
  DeleteMessageListener(this.chatId);

  @override
  String get event => SocketEvents.deleteMessageListener(chatId);

  @override
  void handler(data) {
    final model = DeleteMessageSenderModel.fromJsonCustom(fromBytes(data));

    if (model != null &&
        model.initiator != chatsCubit.myId &&
        model.messages.isNotEmpty) {
      final chatId = model.messages.first.chatId;
      RemoveMessagesHandler(
        model.messages,
        chatId,
        initiatorId: model.initiator,
        deleteOnlyInitiators: true,
      ).call();
      getIt<CustomDeleteMessageListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomDeleteMessageListener {
  Set<Function(DeleteMessageSenderModel)> triggers = {};

  void emitTrigger(DeleteMessageSenderModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
