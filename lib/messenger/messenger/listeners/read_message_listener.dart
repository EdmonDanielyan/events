import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/handler/read_messages.dart';
import 'package:ink_mobile/messenger/messenger/senders/read_message/model.dart';
import 'package:ink_mobile/setup.dart';
import 'listener.dart';

class ReadMessageListener extends Listener {
  final int chatId;
  ReadMessageListener(this.chatId);

  @override
  String get event => SocketEvents.readMessageListener(chatId);

  @override
  void handler(data) {
    final model = ReadMessageModel.fromJsonCustom(fromBytes(data));

    if (model != null &&
        messengerProvider.isListiningToChat(chatId) &&
        model.initiatorId != chatsCubit.myId) {
      ReadMessagesHandler(model.lastMessage, model.initiatorId).call();

      getIt<CustomReadMessageListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomReadMessageListener {
  Set<Function(ReadMessageModel)> triggers = {};

  void emitTrigger(ReadMessageModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
