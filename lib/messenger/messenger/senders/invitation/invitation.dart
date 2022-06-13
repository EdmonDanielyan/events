import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/messenger/senders/sender.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

import 'model.dart';

class InvitationSender extends Sender {
  final InvitationSenderModel model;
  const InvitationSender(this.model);

  void call() {
    getIt<MessengerProvider>()
        .socket
        ?.emit(SocketEvents.invite, toBytes(model.toJson()));
  }
}
