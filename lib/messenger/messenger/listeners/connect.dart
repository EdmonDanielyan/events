import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/handler/fetch/chats.dart';

import 'package:ink_mobile/messenger/handler/senders/send_stored_messages_handler.dart';
import 'listener.dart';

@singleton
class ConnectListener extends Listener {
  @override
  String get event => "";

  int connected = 0;

  @override
  void handler(data) {
    connected++;

    //CONNECTED
    const SendStoredMessagesHandler().call();

    if (connected > 1) {
      const FetchChats().call();
    }

    emitTrigger(data);
  }

  void onError(data) {}
}
