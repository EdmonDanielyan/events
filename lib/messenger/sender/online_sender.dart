import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/setup.dart';

import '../cases/user_functions.dart';

@lazySingleton
class OnlineSender with Loggable {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;

  Timer? _userOnlineTimer;

  OnlineSender(this.natsProvider, this.userFunctions);

  Future<bool> _sendUserOnlinePing(String channel, int userId) async {
    return await natsProvider.sendEmptyMessageToChannel(
      channel,
      MessageType.Online
    );
  }

  Future<void> sendUserOnlinePing() async {
    stopSending();
    _sendOnline(JwtPayload.myId);
    _userOnlineTimer = Timer.periodic(
      Duration(seconds: 10),
      (timer) {
        _sendOnline(JwtPayload.myId);
      },
    );
  }

  void _sendOnline(int userId) {
    print("!!!!!!!!! ${sl<Messenger>().chatDatabaseCubit.db.chatCache}");
    if (natsProvider.isConnected) {
      logger.finest("sendOnline");
      final channel = natsProvider.getOnlineChannel();
      _sendUserOnlinePing(channel, userId);
    }
  }

  void stopSending() {
    _userOnlineTimer?.cancel();
  }
}
