import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/handler/add_users_to_chat.dart';
import 'package:ink_mobile/messenger/messenger/senders/add_participant/model.dart';
import 'package:collection/collection.dart';
import 'package:ink_mobile/setup.dart';
import 'listener.dart';

class AddParticipantListener extends Listener {
  final int chatId;
  AddParticipantListener(this.chatId);

  @override
  String get event => SocketEvents.addParticipantListener(chatId);

  @override
  void handler(data) {
    final model = AddParticipantModel.fromJsonCustom(fromBytes(data));

    if (model != null && messengerProvider.isListiningToChat(chatId)) {
      final chat = chatsCubit.chats
          .firstWhereOrNull((element) => element.id == model.chatId);
      if (chat != null) {
        AddUsersToChatHandler(model.users, chat)();
      }
      getIt<CustomAddParticipantListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomAddParticipantListener {
  Set<Function(AddParticipantModel)> triggers = {};

  void emitTrigger(AddParticipantModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
