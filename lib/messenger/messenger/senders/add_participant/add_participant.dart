import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/messenger/senders/sender.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

import 'model.dart';

class AddParticipantSender extends Sender {
  final AddParticipantModel addParticipantModel;
  const AddParticipantSender(this.addParticipantModel);

  void call() {
    getIt<MessengerProvider>().socket?.emit(
        SocketEvents.addParticipant, toBytes(addParticipantModel.toJson()));
  }
}
