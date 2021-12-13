import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/models/chat/nats/texting.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

@Named("Texting")
@Injectable(as: ChannelListener)
class MessageTextingListener extends ChannelListener {
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
