import 'dart:async';

import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';
import 'channels_registry.dart';

@Named("Online")
@Injectable(as: MessageListener)
class UserOnlineListener extends MessageListener {
  late Timer userOnlineTimer;
  Set<int> subscribedUsers = {};
  Set<int> onlineUsers = {};

  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;

  UserOnlineListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.userFunctions,
    this.chatDatabaseCubit,
  ) : super(natsProvider, registry);

  void clear() {
    subscribedUsers = {};
    onlineUsers = {};
  }

  Future<void> subscribeOnline() async {
    if (!natsProvider.isConnected) return;
    final channel = natsProvider.getOnlineChannel();
    registry.addToListeningChannels(channel);
    await natsProvider.subscribeToChannel(channel, onMessage,
        maxInFlight: 100,
        startSequence: Int64.ZERO, startPosition: StartPosition.NewOnly);
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);

    try {
      final user = int.parse(message.from);

      updateUserStatus(user, true);

      EasyDebounce.debounce(
        user.toString(),
        Duration(seconds: 50),
        () => updateUserStatus(user, false),
      );
    } on NoSuchMethodError {
      return;
    }
  }

  void listenForOffline(UserTable user) {}

  Future<void> updateUserStatus(int user, bool online) async {
    final storedUser = await chatDatabaseCubit.db.selectUserById(user);

    if (storedUser != null && storedUser.online != online) {
      logger.finest(
              ()=>"updateUserStatus: user=${storedUser.name}, was_online: ${storedUser.online}, will_be_online=$online");

      chatDatabaseCubit.db.updateUser(user, storedUser.copyWith(online: online));
    }
    _handleList(user, online);
  }

  void _handleList(int userId, bool online) {
    if (online && !onlineUsers.contains(userId)) {
      onlineUsers.add(userId);
    }

    if (!online && onlineUsers.contains(userId)) {
      onlineUsers.remove(userId);
    }
  }
}
