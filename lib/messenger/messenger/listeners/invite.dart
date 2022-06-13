import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/handler/fetch/participant.dart';
import 'package:ink_mobile/messenger/messenger/senders/invitation/model.dart';
import 'package:collection/collection.dart';
import 'package:ink_mobile/setup.dart';
import 'listener.dart';

@singleton
class InviteListener extends Listener {
  int id = 0;

  @override
  String get event => SocketEvents.inviteListener(id);

  @override
  void handler(data) {
    final model = InvitationSenderModel.fromJsonCustom(fromBytes(data));

    if (model != null) {
      messengerProvider.subscribeToChat(model.chat.id);
      final getChat = chatsCubit.chats
          .firstWhereOrNull((element) => element.id == model.chat.id);

      if (getChat == null) {
        chatsCubit.addChats([model.chat]);

        FetchPartcipants(model.chat.participants).call();
      }
      getIt<CustomInviteListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomInviteListener {
  Set<Function(InvitationSenderModel)> triggers = {};

  void emitTrigger(InvitationSenderModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
