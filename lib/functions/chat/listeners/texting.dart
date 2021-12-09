import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/models/chat/nats/texting.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
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

  ChannelsRegistry get natsListener =>
      UseMessageProvider.messageProvider!.registry;

  ChannelFunctions get channelFunctions =>
      UseMessageProvider.messageProvider!.channelFunctions;

  bool isListeningToChannel(String channel) =>
      natsListener.isListening(channel);

  Future<void> onMessage(String channel, NatsMessage message) async {
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
    print("TEXTING");
    String churrentOpenedChatId = chatDatabaseCubit.getSelectedChatId;
    if (texting.user.id != JwtPayload.myId && churrentOpenedChatId == chatId) {
      _debouncer.run(() {
        chatCubit.emitTexting(
          texting.copyWith(customTextingEnum: CustomTextingEnum.EMPTY),
        );
      });
      chatCubit.emitTexting(texting);
    }
  }
}
