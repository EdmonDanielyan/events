import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/messenger/senders/sender.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

import 'model.dart';

class RemoveParticipantSender extends Sender {
  final RemoveParticipantModel removeParticipantModel;
  const RemoveParticipantSender(this.removeParticipantModel);

  void call() {
    getIt<MessengerProvider>().socket?.emit(SocketEvents.removeParticipant,
        toBytes(removeParticipantModel.toJson()));
  }
}
