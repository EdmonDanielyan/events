import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';

import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/database/tables/channel.dart';
import 'package:ink_mobile/models/chat/database/tables/chat_table.dart';
import 'package:ink_mobile/models/chat/database/tables/message_table.dart';
import 'package:ink_mobile/models/chat/database/tables/participant_table.dart';
import 'package:ink_mobile/models/chat/database/tables/user_table.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:moor/moor.dart';
import 'package:encrypted_moor/encrypted_moor.dart';

import 'model/participant_with_user.dart';

part 'chat_db.g.dart';

@singleton
@UseMoor(tables: [
  ChatTables,
  MessageTables,
  UserTables,
  ParticipantTables,
  ChannelTables
])
class ChatDatabase extends _$ChatDatabase {
  ChatDatabase()
      : super(
          EncryptedExecutor.inDatabaseFolder(
            path: "chat_db.sqlite",
            password: "1234",
            logStatements: true,
          ),
        );

  //CHATS
  Future<List<ChatTable>> getAllChats() => select(chatTables).get();
  Stream<List<ChatTable>> searchChats(String query) {
    return (select(chatTables)
          ..where((tbl) => tbl.name.like('%$query%'))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Stream<List<ChatTable>> watchAllChats() => (select(chatTables)
        ..orderBy([
          (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc)
        ]))
      .watch();
  Stream<ChatTable> watchChatById(String id) =>
      (select(chatTables)..where((tbl) => tbl.id.equals(id))).watchSingle();
  Future<int> insertChat(ChatTable chat) => into(chatTables).insert(chat);
  Future updateChat(ChatTable chat) => update(chatTables).replace(chat);
  Future updateChatById(String id, ChatTable chat) =>
      (update(chatTables)..where((tbl) => tbl.id.equals(id))).write(chat);
  Future deleteChat(ChatTable chat) => delete(chatTables).delete(chat);
  Future deleteChatById(String id) =>
      (delete(chatTables)..where((tbl) => tbl.id.equals(id))).go();

  //MESSAGES
  Future<int> insertMessage(MessageTable messageTable) =>
      into(messageTables).insert(messageTable);
  Future<MessageTable?> searchMessageByText(String query) =>
      (select(messageTables)..where((tbl) => tbl.message.contains(query)))
          .getSingleOrNull();
  Stream<List<MessageWithUser>> watchChatMessages(String chatId) {
    return (select(messageTables)
          ..where((tbl) => tbl.chatId.equals(chatId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.created, mode: OrderingMode.asc)
          ]))
        .join([
          leftOuterJoin(
              userTables, userTables.id.equalsExp(messageTables.userId))
        ])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return MessageWithUser(
              message: row.readTableOrNull(messageTables),
              user: row.readTableOrNull(userTables),
            );
          }).toList();
        });
  }

  Stream<List<MessageWithUser>> watchChatFilesMessages(String chatId) {
    return (select(messageTables)
          ..where((tbl) =>
              tbl.chatId.equals(chatId) & (tbl.message.contains("http")))
          ..orderBy([
            (t) => OrderingTerm(expression: t.created, mode: OrderingMode.asc)
          ]))
        .join([
          leftOuterJoin(
              userTables, userTables.id.equalsExp(messageTables.userId))
        ])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return MessageWithUser(
              message: row.readTableOrNull(messageTables),
              user: row.readTableOrNull(userTables),
            );
          }).toList();
        });
  }

  Future<List<MessageWithUser>> getChatMessages(String chatId) async {
    return await (select(messageTables)
          ..where((tbl) => tbl.chatId.equals(chatId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.created, mode: OrderingMode.asc)
          ]))
        .join([
          leftOuterJoin(
              userTables, userTables.id.equalsExp(messageTables.userId))
        ])
        .get()
        .then((rows) {
          return rows.map((row) {
            return MessageWithUser(
              message: row.readTableOrNull(messageTables),
              user: row.readTableOrNull(userTables),
            );
          }).toList();
        });
  }

  Future deleteMessagesByChatId(String chatId) =>
      (delete(messageTables)..where((tbl) => tbl.chatId.equals(chatId))).go();
  Future deleteMessageById(String id) =>
      (delete(messageTables)..where((tbl) => tbl.id.equals(id))).go();

  //USER
  Future<int> insertUser(UserTable user) => into(userTables).insert(user);
  Future<int> updateUser(int id, UserTable user) =>
      (update(userTables)..where((tbl) => tbl.id.equals(id))).write(user);
  Future<UserTable?> selectUserById(int id) =>
      (select(userTables)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Stream<UserTable> watchUser(int userId) =>
      (select(userTables)..where((tbl) => tbl.id.equals(userId))).watchSingle();

  //CHANNEL
  Future<List<ChannelTable>> getAllChannels() => select(channelTables).get();
  Future<ChannelTable?> getChannelByChannelName(String channelName) =>
      (select(channelTables)..where((tbl) => tbl.to.equals(channelName)))
          .getSingleOrNull();
  Future<int> insertChannel(ChannelTable channel) =>
      into(channelTables).insert(channel);
  Future<int> updateChannelByChannelName(
          String channelName, ChannelTable channel) =>
      (update(channelTables)..where((tbl) => tbl.to.equals(channelName)))
          .write(channel);

  //PARTICIPANTS
  Future<int> insertParticipant(ParticipantTable participant) =>
      into(participantTables).insert(participant);
  Future<ParticipantTable?> selectParticipantById(int id, String chatId) =>
      (select(participantTables)
            ..where((tbl) => tbl.userId.equals(id) & tbl.chatId.equals(chatId)))
          .getSingleOrNull();
  Stream<List<ParticipantWithUser>> watchParticipants(String chatId) {
    return (select(participantTables)
          ..where((tbl) => tbl.chatId.equals(chatId)))
        .join([
          leftOuterJoin(
              userTables, userTables.id.equalsExp(participantTables.userId))
        ])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return ParticipantWithUser(
              participant: row.readTableOrNull(participantTables),
              user: row.readTableOrNull(userTables),
            );
          }).toList();
        });
  }

  @override
  int get schemaVersion => 17;

  @override
  //USED TO AVOID APP CRASH AFTER CHANING DB
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {},
      );
}
