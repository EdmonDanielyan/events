import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/online.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:fixnum/fixnum.dart';

import '../user_functions.dart';
import 'channels_registry.dart';

@Named("Online")
@Injectable(as: ChannelListener)
class UserOnlineListener extends ChannelListener {
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

  Future<void> subscribeToAllAvailableUsers() async {
    final users = await chatDatabaseCubit.db.getAllUsers();

    if (users.isNotEmpty) {
      for (final user in users) {
        await subscribeIndividually(user);
      }
    }
  }

  Future<void> subscribeIndividually(UserTable user) async {
    try {
      if (!subscribedUsers.contains(user.id)) {
        updateUserStatus(user, false);
        subscribedUsers.add(user.id);
        final channel = natsProvider.getUserOnlineChannel(user.id);
        registry.addToListeningChannels(channel);
        bool sub = await natsProvider.subscribeToChannel(channel, onMessage,
            startSequence: Int64.ZERO);

        if (!sub) {
          throw "offline";
        }
      }
    } on SubscriptionAlreadyExistException {
    } catch (e) {
      //CLIENT IS OFFLINE

      logger.warning("Error during subscribe", e);
      updateUserStatus(user, false);
    }
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);

    try {
      final mapPayload = message.payload! as SystemPayload;
      UserOnlineFields fields = UserOnlineFields.fromMap(mapPayload.fields);
      final user = fields.user;

      updateUserStatus(user, true);

      EasyDebounce.debounce(
        user.id.toString(),
        Duration(seconds: 50),
        () => updateUserStatus(user, false),
      );
    } on NoSuchMethodError {
      return;
    }
  }

  void listenForOffline(UserTable user) {}

  Future<void> updateUserStatus(UserTable user, bool online) async {
    final storedUser = await chatDatabaseCubit.db.selectUserById(user.id);

    if (storedUser != null && storedUser.online != online) {
      logger.finest(
          "updateUserStatus: user=${user.name}, was_online: ${user.online}, will_be_online=$online");

      chatDatabaseCubit.db.updateUser(user.id, user.copyWith(online: online));
    }
    _handleList(user, online);
  }

  void _handleList(UserTable user, bool online) {
    if (online && !onlineUsers.contains(user.id)) {
      onlineUsers.add(user.id);
    }

    if (!online && onlineUsers.contains(user.id)) {
      onlineUsers.remove(user.id);
    }
  }
}
