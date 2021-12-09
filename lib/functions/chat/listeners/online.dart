import 'dart:async';

import 'package:fixnum/fixnum.dart';
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

  Future<void> onListen(String channel,
      {Int64 startSequence = Int64.ZERO}) async {}

  Future<void> subscribe(UserTable user) async {
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


}
