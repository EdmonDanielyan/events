import 'dart:async';

import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/online.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';

class UserOnlineListener {
  late Timer userOnlineTimer;
  static Set<int> subscribedUsers = {};

  final MessageProvider messageProvider;
  final NatsProvider natsProvider;
  final ChatDatabaseCubit chatDatabaseCubit;
  UserOnlineListener({
    required this.messageProvider,
    required this.natsProvider,
    required this.chatDatabaseCubit,
  });

  Debouncer _debouncer = Debouncer(milliseconds: 90000);

  Future<void> listenTo(UserTable user) async {
    try {
      if (!subscribedUsers.contains(user.id)) {
        final channel = natsProvider.getUserOnlineChannel(user.id);
        bool sub = await natsProvider.subscribeToChannel(channel, onMessage);

        if (sub) {
          subscribedUsers.add(user.id);
        } else {
          throw "offline";
        }
      }
    } on SubscriptionAlreadyExistException {
    } catch (e) {
      //CLIENT IS OFFLINE
      updateUserStatus(user, false);
    }
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
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
    chatDatabaseCubit.db.updateUser(user.id, user.copyWith(online: online));
  }

  Future<void> sendUserOnlinePing({UserTable? user}) async {
    user = user ?? UserFunctions.getMe;
    final channel = natsProvider.getUserOnlineChannel(user.id);

    _sendOnline(channel, user);

    userOnlineTimer = Timer.periodic(
      Duration(seconds: 60),
      (timer) {
        _sendOnline(channel, user!);
      },
    );
  }

  void _sendOnline(String channel, UserTable user) {
    if (natsProvider.isConnected) {
      messageProvider.chatSendMessage.sendUserOnlinePing(channel, user);
    }
  }

  void stopSending() {
    userOnlineTimer.cancel();
  }
}
