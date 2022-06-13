import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/messenger/senders/sender.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

import 'model.dart';

class OnlineSender extends Sender {
  final OnlineModel model;
  const OnlineSender(this.model);

  void call() {
    getIt<MessengerProvider>()
        .socket
        ?.emit(SocketEvents.online, toBytes(model.toJson()));
  }
}
