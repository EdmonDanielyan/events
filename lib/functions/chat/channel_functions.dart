import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/channel.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';

class ChannelFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChannelFunctions(this.chatDatabaseCubit);

  Future<void> saveNatsMessage(NatsMessage message) async {
    ChannelTable channel = ChannelListView.messageNatsToChannel(message);
    await insertOrUpdate(channel);
  }

  Future<ChannelTable?> saveByChannelName(String channelName) async {
    final channel = ChannelListView.channelNameToChannel(channelName);
    if (channel != null) {
      await insertOrUpdate(channel);
      return channel;
    }

    return null;
  }

  Future<void> insertOrUpdate(ChannelTable channel) async {
    bool isChannelExists = await channelExists(channel.to);

    if (isChannelExists) {
      await updateChannel(channel);
    } else {
      await insertChannel(channel);
    }
  }

  Future<ChannelTable?> getChannel(String channelName) async {
    return await chatDatabaseCubit.db.getChannelByChannelName(channelName);
  }

  Future<bool> channelExists(String channelName) async {
    try {
      return await chatDatabaseCubit.db.getChannelByChannelName(channelName) !=
          null;
    } on StateError {
      return true;
    }
  }

  Future<int?> insertChannel(ChannelTable channel) async {
    return await chatDatabaseCubit.db.insertChannel(channel);
  }

  Future<int?> insertIfNotExists(ChannelTable channel) async {
    bool isChannelExists = await channelExists(channel.to);

    if (!isChannelExists) {
      await insertChannel(channel);
    }
  }

  Future<int?> updateChannel(ChannelTable channel) async {
    return await chatDatabaseCubit.db
        .updateChannelByChannelName(channel.to, channel);
  }

  Future<List<ChannelTable>> getAllChannels() async {
    return await chatDatabaseCubit.db.getAllChannels();
  }

  Future deleteChannel(String channelName) async {
    return await chatDatabaseCubit.db.deleteChannelByChannelName(channelName);
  }
}
