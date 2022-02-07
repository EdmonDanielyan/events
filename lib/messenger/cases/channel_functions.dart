import 'dart:convert';

import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/channel.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';

@injectable
class ChannelFunctions with Loggable {
  final ChatDatabaseCubit chatDatabaseCubit;

  ChannelFunctions(this.chatDatabaseCubit);

  Future<void> saveNatsMessage(NatsMessage message) async {
    logger.finest(() => "saveNatsMessage: $message");
    ChannelTable channel = ChannelListView.messageNatsToChannel(message);
    await insertOrUpdate(channel);
  }

  Future<ChannelTable?> saveByChannelName(String channelName,
      {Int64? sequence}) async {
    logger.finest(() => "saveByChannelName: $channelName");

    final channel =
        ChannelListView.channelNameToChannel(channelName, sequence: sequence);
    if (channel != null) {
      await insertOrUpdate(channel);
      return channel;
    }

    return null;
  }

  Future<void> insertOrUpdate(ChannelTable channel) async {
    logger.finest(() => "insertOrUpdate: $channel");
    final storedChannel = await getChannel(channel.id);

    if (storedChannel != null) {
      int currentChannelSeq = storedChannel.sequence;
      int updateChannelSeq = channel.sequence;

      if (updateChannelSeq >= currentChannelSeq) {
        await updateChannel(channel);
      }
    } else {
      await insertChannel(channel);
    }
  }

  Future<ChannelTable?> getChannel(String channelName) async {
    logger.finest(() => "getChannel: $channelName");
    return await chatDatabaseCubit.db.getChannelById(channelName);
  }

  Future<bool> channelExists(String id) async {
    logger.finest(() => "channelExists: $id");
    try {
      return await getChannel(id) != null;
    } on StateError {
      return true;
    }
  }

  Future<int?> insertChannel(ChannelTable channel) async {
    logger.finest(() => "insertChannel: $channel");
    return await chatDatabaseCubit.db.insertChannel(channel);
  }

  Future<int?> insertIfNotExists(ChannelTable channel) async {
    logger.finest(() => "insertIfNotExists: $channel");
    bool isChannelExists = await channelExists(channel.id);

    if (!isChannelExists) {
      await insertChannel(channel);
    }
    return null;
  }

  Future<int?> updateChannel(ChannelTable channel) async {
    logger.finest(() => "updateChannel: $channel");
    return await chatDatabaseCubit.db
        .updateChannelById(channel.id, channel);
  }

  Future<List<ChannelTable>> getAllChannels() async {
    logger.finest("getAllChannels");
    return await chatDatabaseCubit.db.getAllChannels();
  }

  Future deleteChannel(String channelName) async {
    logger.finest(() => "deleteChannel: $channelName");
    return await chatDatabaseCubit.db.deleteChannelById(channelName);
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
