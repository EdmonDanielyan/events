import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/handler/update_chat_handler.dart';
import 'package:ink_mobile/messenger/messenger/senders/update_chat/model.dart';
import 'package:ink_mobile/setup.dart';
import 'listener.dart';

class UpdateChatListener extends Listener {
  final int chatId;
  UpdateChatListener(this.chatId);

  @override
  String get event => SocketEvents.updateChatListener(chatId);

  @override
  void handler(data) {
    final model = UpdateChatModel.fromJsonCustom(fromBytes(data));

    if (model != null && messengerProvider.isListiningToChat(chatId)) {
      if (model.initiator != chatsCubit.myId) {
        UpdateChatHandler(model.chat).call();
      }

      getIt<CustomUpdateChatListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomUpdateChatListener {
  Set<Function(UpdateChatModel)> triggers = {};

  void emitTrigger(UpdateChatModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
