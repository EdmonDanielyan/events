import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/cases/send_message.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/listeners/message_listener.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/left_joined.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/sender/chat_saver.dart';
import 'package:ink_mobile/messenger/sender/invite_sender.dart';
import 'package:ink_mobile/models/debouncer.dart';

import '../cases/user_functions.dart';
import 'channels_registry.dart';

@Named("UserJoined")
@Injectable(as: MessageListener)
class ChatJoinedListener extends MessageListener {
  final ChatFunctions chatFunctions;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatSaver chatSaver;
  final InviteSender messageSender;

  ChatJoinedListener(
      NatsProvider natsProvider,
      ChannelsRegistry registry,
      this.userFunctions,
      this.chatDatabaseCubit,
      this.messageSender,
      this.chatSaver,
      this.chatFunctions)
      : super(natsProvider, registry);

  List<NatsMessage> _buffer = [];
  final _debouncer = Debouncer(milliseconds: 100);

  Future<void> onMessage(String channel, NatsMessage _message) async {
    super.onMessage(channel, _message);
    if (!registry.isListening(channel)) {
      return;
    }

    _buffer.add(_message);
    _debouncer.run(() async {
      final _currentBuffer = _buffer;
      _buffer = [];
      List<UserTable> _users = [];
      List<ParticipantTable> _participants = [];
      List<MessageTable> _messages = [];

      for (var message in _currentBuffer) {
        final mapPayload = message.payload! as JsonPayload;
        LeftJoinedPayload payload = LeftJoinedPayload.fromJson(mapPayload.json);

        var _chatUsers =
            payload.users.map<UserTable>((e) => e.toUserTable()).toList();
        _users.addAll(_chatUsers);

        var _chat = await chatDatabaseCubit.db.selectChatById(payload.chatId);
        if (_chat != null) {
          _participants
              .addAll(ChatUserViewModel.toParticipants(_chatUsers, _chat));
          if (_chat.isGroup()) {
            for (final user in _chatUsers) {
              var generatedMessage = GetIt.I<SendMessage>().joinedLeftMessage(
                id: "${message.id}_${user.id}",
                chatId: _chat.id,
                userName: user.name,
                type: StoredMessageType.USER_JOINED,
                timestampUtc: message.timestamp,
                userId: user.id,
                sequence: message.sequence.toInt(),
                initiatorId: payload.initiatorId,
              );

              if (generatedMessage != null) {
                _messages.add(generatedMessage);
              }
            }
          }
        }
      }

      await userFunctions.insertMultipleUsers(_users);
      await userFunctions.insertMultipleParticipants(_participants);
      await chatDatabaseCubit.db.insertMultipleMessages(_messages);
      await chatSaver.saveChats(newChat: null);
    });
  }
}
