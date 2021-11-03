import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/channel.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';

class ChannelFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChannelFunctions(this.chatDatabaseCubit);

  Future<void> saveNatsMessage(NatsMessage message) async {
    ChannelTable channel = ChannelListView.messageNatsToChannel(message);
    bool isChannelExists = await channelExists(channel);

    if (isChannelExists) {
      await updateChannel(channel);
    } else {
      await insertChannel(channel);
    }
  }

  Future<bool> channelExists(ChannelTable channel) async {
    return await chatDatabaseCubit.db.getChannelByChannelName(channel.to) !=
        null;
  }

  Future<int?> insertChannel(ChannelTable channel) async {
    return await chatDatabaseCubit.db.insertChannel(channel);
  }

  Future<int?> updateChannel(ChannelTable channel) async {
    return await chatDatabaseCubit.db
        .updateChannelByChannelName(channel.to, channel);
  }

  Future<List<ChannelTable>> getAllChannels() async {
    return await chatDatabaseCubit.db.getAllChannels();
  }
}
