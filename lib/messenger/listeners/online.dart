import 'dart:async';

import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/constants/nats_constants.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';

import '../cases/user_functions.dart';
import 'channels_registry.dart';
import 'message_listener.dart';

@Named("Online")
@Injectable(as: MessageListener)
class UserOnlineListener extends MessageListener {

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
    if (registry.isListening(channel)) return;
    await natsProvider.subscribeToChannel(channel, onMessage,
        ackWaitSeconds: ACK_WAITS_SECONDS,
        // maxInFlight: 100,
        startSequence: Int64.ZERO, startPosition: StartPosition.NewOnly);
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);

    try {
      final user = int.parse(message.from);
      _handleStatus(user);
    } on NoSuchMethodError {
      return;
    }
  }

  void _handleStatus(int userId) {
     messenger.onlineBloc.updateOnlineUsers([userId]);
  }
}
