import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class NatsListener {
  final NatsProvider natsProvider;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChannelFunctions channelFunctions;
  const NatsListener({
    required this.natsProvider,
    required this.chatDatabaseCubit,
    required this.channelFunctions,
  });

  Future<void> listenToAllMessages() async {
    natsProvider.onMessage = (String channelStr, NatsMessage message) async {
      _hidePingPong(message, () {
        print("LISTENING TO ALL MESSAGES");
        channelFunctions.saveNatsMessage(message);
      });
    };
  }

  Future<void> listenToMyStoredChannels() async {
    List<ChannelTable> channels = await channelFunctions.getAllChannels();
    print("LISTENING TO MY CHHANNELS");
    if (channels.isNotEmpty) {
      print("CAHNNELS EXISTS");
      for (final channel in channels) {
        print(channel.to);
      }
    }
  }

  void _hidePingPong(NatsMessage message, Function() callback) {
    bool notMe = message.from != JwtPayload.myId.toString();
    bool payloadIsNotMessage = message.type != PayloadType.message;
    if (notMe && payloadIsNotMessage) {
      callback();
    }
  }
}
