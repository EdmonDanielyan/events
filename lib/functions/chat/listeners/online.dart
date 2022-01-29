import 'dart:async';

import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/messenger.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';
import 'channels_registry.dart';
import 'message_listener.dart';

@Named("Online")
@Injectable(as: MessageListener)
class UserOnlineListener extends MessageListener {
  late Timer userOnlineTimer;

  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;

  Messenger messenger;

  UserOnlineListener(NatsProvider natsProvider,
      ChannelsRegistry registry,
      this.messenger,
      this.userFunctions,
      this.chatDatabaseCubit,) : super(natsProvider, registry);

  Future<void> subscribeOnline() async {
    if (!natsProvider.isConnected) return;
    final channel = natsProvider.getOnlineChannel();
    await natsProvider.subscribeToChannel(channel, onMessage,
        maxInFlight: 100,
        startSequence: Int64.ZERO, startPosition: StartPosition.NewOnly);
    registry.addToListeningChannels(channel);
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);

    try {
      final user = int.parse(message.from);

      _handleStatus(user, true);

      EasyDebounce.debounce(
          user.toString(),
          Duration(seconds: 50),
              () => _handleStatus(user, false)
      );
    } on NoSuchMethodError {
      return;
    }
  }

  void _handleStatus(int userId, bool online) {
    if (online && !messenger.onlineUsers.contains(userId)) {
      messenger.onlineUsers.add(userId);
    }

    if (!online && messenger.onlineUsers.contains(userId)) {
      messenger.onlineUsers.remove(userId);
    }
  }
}
