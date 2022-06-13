import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/handler/remove_users_from_chat.dart';
import 'package:ink_mobile/messenger/messenger/senders/remove_participant/model.dart';
import 'package:collection/collection.dart';
import 'package:ink_mobile/setup.dart';
import 'listener.dart';

class RemoveParticipantListener extends Listener {
  final int chatId;
  RemoveParticipantListener(this.chatId);

  @override
  String get event => SocketEvents.removeParticipantListener(chatId);

  @override
  void handler(data) {
    final model = RemoveParticipantModel.fromJsonCustom(fromBytes(data));

    if (model != null && messengerProvider.isListiningToChat(chatId)) {
      final chat = chatsCubit.chats
          .firstWhereOrNull((element) => element.id == model.chatId);
      if (chat != null) {
        RemoveUsersFromChatHandler(model.users, chat,
            initiatorId: model.initiatorId)();
      }

      getIt<CustomRemoveParticipantListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomRemoveParticipantListener {
  Set<Function(RemoveParticipantModel)> triggers = {};

  void emitTrigger(RemoveParticipantModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
