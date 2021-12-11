import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/channel.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';

@injectable
class ChannelFunctions with Loggable {
  final ChatDatabaseCubit chatDatabaseCubit;

  ChannelFunctions(this.chatDatabaseCubit);

  Future<void> saveNatsMessage(NatsMessage message) async {
    logger.finest("saveNatsMessage: $message");
    ChannelTable channel = ChannelListView.messageNatsToChannel(message);
    await insertOrUpdate(channel);
  }

  Future<ChannelTable?> saveByChannelName(String channelName) async {
    logger.finest("saveByChannelName: $channelName");

    final channel = ChannelListView.channelNameToChannel(channelName);
    if (channel != null) {
      await insertOrUpdate(channel);
      return channel;
    }

    return null;
  }

  Future<void> insertOrUpdate(ChannelTable channel) async {
    logger.finest("insertOrUpdate: $channel");
    final storedChannel = await getChannel(channel.to);

    if (storedChannel != null) {
      int currentChannelSeq = int.tryParse(storedChannel.sequence) ?? 0;
      int updateChannelSeq = int.tryParse(channel.sequence) ?? 0;

      if (updateChannelSeq >= currentChannelSeq) {
        await updateChannel(channel);
      }
    } else {
      await insertChannel(channel);
    }
  }

  Future<ChannelTable?> getChannel(String channelName) async {
    logger.finest("getChannel: $channelName");
    return await chatDatabaseCubit.db.getChannelByChannelName(channelName);
  }

  Future<bool> channelExists(String channelName) async {
    logger.finest("channelExists: $channelName");
    try {
      return await getChannel(channelName) != null;
    } on StateError {
      return true;
    }
  }

  Future<int?> insertChannel(ChannelTable channel) async {
    logger.finest("insertChannel: $channel");
    return await chatDatabaseCubit.db.insertChannel(channel);
  }

  Future<int?> insertIfNotExists(ChannelTable channel) async {
    logger.finest("insertIfNotExists: $channel");
    bool isChannelExists = await channelExists(channel.to);

    if (!isChannelExists) {
      await insertChannel(channel);
    }
  }

  Future<int?> updateChannel(ChannelTable channel) async {
    logger.finest("updateChannel: $channel");
    return await chatDatabaseCubit.db
        .updateChannelByChannelName(channel.to, channel);
  }

  Future<List<ChannelTable>> getAllChannels() async {
    logger.finest("getAllChannels");
    return await chatDatabaseCubit.db.getAllChannels();
  }

  Future deleteChannel(String channelName) async {
    logger.finest("deleteChannel: $channelName");
    return await chatDatabaseCubit.db.deleteChannelByChannelName(channelName);
  }

  static String listChannelsToString(List<ChannelTable> channels) {
    List<String> object = [];

    for (final channel in channels) {
      object.add(toJsonString(channel));
    }

    return jsonEncode(object);
  }

  static String toJsonString(ChannelTable channel) {
    return jsonEncode(toJson(channel));
  }

  static Map<String, dynamic> toJson(ChannelTable channel) {
    final json = channel.toJson();
    json["messageType"] =
        MessageListView.messageEnumToString(json["messageType"]);
    json["payloadType"] =
        MessageListView.messageEnumToString(json["payloadType"]);
    return json;
  }

  static List<ChannelTable> getChannelsFromString(String data) {
    List<ChannelTable> channels = [];
    try {
      final items = jsonDecode(data) as List<dynamic>;

      for (final item in items) {
        channels.add(fromString(item));
      }
    } on NoSuchMethodError {}

    return channels;
  }

  static ChannelTable fromString(String str) {
    return fromJson(jsonDecode(str));
  }

  static ChannelTable fromJson(Map<String, dynamic> json) {
    json["messageType"] =
        MessageListView.messageTypeStringToEnum(json["messageType"]);
    json["payloadType"] = payloadStringToObject(json["payloadType"]);
    return ChannelTable.fromJson(json);
  }

  static PayloadType payloadStringToObject(String json) {
    for (final value in PayloadType.values) {
      if (json
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        return value;
      }
    }
    return PayloadType.empty;
  }
}
