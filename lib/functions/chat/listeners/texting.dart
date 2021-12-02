import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/models/chat/nats/texting.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

@injectable
class MessageTextingListener {
  final NatsProvider natsProvider;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;
  MessageTextingListener({
    required this.natsProvider,
    required this.chatDatabaseCubit,
    required this.chatCubit,
  });

  Debouncer _debouncer = Debouncer(milliseconds: 3000);

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider!.natsListener;

  ChannelFunctions get channelFunctions =>
      UseMessageProvider.messageProvider!.channelFunctions;
  bool isListeningToChannel(String channel) =>
      natsListener.listeningToChannel(channel);

  Future<void> listenTo(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    try {
      if (!isListeningToChannel(channel)) {
        await natsProvider.subscribeToChannel(channel, onMessage,
            startSequence: startSequence);
      }
    } on SubscriptionAlreadyExistException {}
  }

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
