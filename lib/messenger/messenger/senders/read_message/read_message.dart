import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/messenger/senders/sender.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

import 'model.dart';

class ReadMessageSender extends Sender {
  final ReadMessageModel model;
  const ReadMessageSender(this.model);

  void call() {
    getIt<MessengerProvider>()
        .socket
        ?.emit(SocketEvents.readMessage, toBytes(model.toJson()));
  }
}
