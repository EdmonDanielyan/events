import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/handler/update_messages.dart';
import 'package:ink_mobile/messenger/messenger/senders/update_message/model.dart';
import 'package:ink_mobile/setup.dart';

import 'listener.dart';

class UpdateMessageListener extends Listener {
  final int chatId;
  UpdateMessageListener(this.chatId);

  @override
  String get event => SocketEvents.updateMessageListener(chatId);

  @override
  void handler(data) {
    final model = UpdateMessageSenderModel.fromJsonCustom(fromBytes(data));

    if (model != null &&
        model.initiator != chatsCubit.myId &&
        model.messages.isNotEmpty) {
      final chatId = model.messages.first.chatId;
      UpdateMessagesHandler(
        model.messages,
        chatId,
        initiatorId: model.initiator,
      ).call();

      getIt<CustomUpdateMessageListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomUpdateMessageListener {
  Set<Function(UpdateMessageSenderModel)> triggers = {};

  void emitTrigger(UpdateMessageSenderModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
