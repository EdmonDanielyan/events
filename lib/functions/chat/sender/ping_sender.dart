import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/online.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';

@injectable
class PingSender {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;

  Timer? _userOnlineTimer;

  PingSender(this.natsProvider, this.userFunctions);

  Future<bool> _sendUserOnlinePing(String channel, UserTable user) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.Online,
      UserOnlineFields(user: user).toMap(),
    );
  }

  Future<void> sendUserOnlinePing({UserTable? user}) async {
    user = user ?? userFunctions.me;
    final channel = natsProvider.getUserOnlineChannel(user.id);

    _sendOnline(channel, user);

    _userOnlineTimer = Timer.periodic(
      Duration(seconds: 60),
          (timer) {
        _sendOnline(channel, user!);
      },
    );
  }

  void _sendOnline(String channel, UserTable user) {
    if (natsProvider.isConnected) {
      _sendUserOnlinePing(channel, user);
    }
  }

  void stopSending() {
    _userOnlineTimer?.cancel();
  }

}