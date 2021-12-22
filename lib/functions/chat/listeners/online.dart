import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/online.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';
import 'channels_registry.dart';

@Named("Online")
@Injectable(as: ChannelListener)
class UserOnlineListener extends ChannelListener {
  late Timer userOnlineTimer;
  static Set<int> subscribedUsers = {};
  static Set<int> onlineUsers = {};

  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;

  final InviteSender messageSender;

  UserOnlineListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.userFunctions,
    this.messageSender,
    this.chatDatabaseCubit,
  ) : super(natsProvider, registry);

  Debouncer _debouncer = Debouncer(milliseconds: 90000);

  Future<void> subscribe(UserTable user) async {
    try {
      if (!subscribedUsers.contains(user.id)) {
        subscribedUsers.add(user.id);
        final channel = natsProvider.getUserOnlineChannel(user.id);
        bool sub = await natsProvider.subscribeToChannel(channel, onMessage);

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

      _debouncer.run(() {
        updateUserStatus(user, false);
      });
    } on NoSuchMethodError {
      return;
    }
  }

  void updateUserStatus(UserTable user, bool online) {
    logger.finest(
        "updateUserStatus: user=${user.name}, was_online: ${user.online}, will_be_online=$online");
    _handleList(user, online);
    chatDatabaseCubit.db.updateUser(user.id, user.copyWith(online: online));
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
