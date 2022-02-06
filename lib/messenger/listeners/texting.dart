import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/listeners/channels_registry.dart';
import 'package:ink_mobile/messenger/listeners/message_listener.dart';
import 'package:ink_mobile/messenger/models/chat/nats/texting.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/models/texting.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

@Named("Texting")
@Injectable(as: MessageListener)
class MessageTextingListener extends MessageListener {
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;

  MessageTextingListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.chatDatabaseCubit,
    this.chatCubit,
  ) : super(natsProvider, registry);

  Debouncer _debouncer = Debouncer(milliseconds: 3000);

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!isListeningToChannel(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as SystemPayload;
      ChatTextingFields fields = ChatTextingFields.fromMap(mapPayload.fields);
      _handleState(fields.texting, fields.chatId);
    } on NoSuchMethodError {
      return;
    }
  }

  void _handleState(CustomTexting texting, String chatId) {
    logger.finest("TEXTING");
    String currentOpenedChatId = chatDatabaseCubit.getSelectedChatId;
    if (texting.user.id != JwtPayload.myId && currentOpenedChatId == chatId) {
      _debouncer.run(() {
        chatCubit.emitTexting(
          texting.copyWith(customTextingEnum: CustomTextingEnum.EMPTY),
        );
      });
      chatCubit.emitTexting(texting);
    }
  }
}
