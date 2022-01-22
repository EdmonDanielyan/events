import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/online.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';

@lazySingleton
class OnlineSender with Loggable {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;

  Timer? _userOnlineTimer;

  OnlineSender(this.natsProvider, this.userFunctions);

  Future<bool> _sendUserOnlinePing(String channel, UserTable user) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.Online,
      UserOnlineFields(user: user).toMap(),
    );
  }

  Future<void> sendUserOnlinePing({UserTable? user}) async {
    stopSending();
    user = user ?? userFunctions.me;
    _sendOnline(user);
    _userOnlineTimer = Timer.periodic(
      Duration(seconds: 10),
      (timer) {
        _sendOnline(user!);
      },
    );
  }

  void _sendOnline(UserTable user) {
    if (natsProvider.isConnected) {
      logger.finest("sendOnline");
      final channel = natsProvider.getOnlineChannel();
      _sendUserOnlinePing(channel, user);
    }
  }

  void stopSending() {
    _userOnlineTimer?.cancel();
  }
}
