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

@lazySingleton
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
            logStatements: false,
          ),
        );

  //CHATS
  Future<ChatTable?> selectChatById(String chatId) =>
      (select(chatTables)..where((tbl) => tbl.id.equals(chatId)))
          .getSingleOrNull();
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
  Future<void> insertMultipleChats(List<ChatTable> chats) async {
    await batch((batch) {
      batch.insertAll(
        chatTables,
        chats.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future updateChatById(String id, ChatTable chat) =>
      (update(chatTables)..where((tbl) => tbl.id.equals(id)))
          .write(chat)
          .catchError((_e) {
        throw "Sql migration error. Reinstall the app, please";
      });
  Future deleteChat(ChatTable chat) => delete(chatTables).delete(chat);
  Future deleteChatById(String id) =>
      (delete(chatTables)..where((tbl) => tbl.id.equals(id))).go();

  //MESSAGES
  Stream<List<MessageTable>> watchAllMessages() =>
      (select(messageTables)).watch();
  Future<List<MessageTable>> getAllMessages() => select(messageTables).get();
  Future<MessageTable?> selectMessageById(String id) =>
      (select(messageTables)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();
  Future<int> updateMessageById(String id, MessageTable message) =>
      (update(messageTables)..where((tbl) => tbl.id.equals(id))).write(message);
  Future<int> countUnreadMessages(String id) async {
    var count = countAll(
        filter: messageTables.id.equals(id) &
            messageTables.status.equals(MessageStatus.READ.index).not());
    var res = await (selectOnly(messageTables)..addColumns([count]))
        .map((row) => row.read(count))
        .getSingle();
    return res;
  }

  Future<int> insertMessage(MessageTable messageTable) =>
      into(messageTables).insert(messageTable);
  Future<void> insertMultipleMessages(List<MessageTable> messages) async {
    await batch((batch) {
      batch.insertAll(
        messageTables,
        messages.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<MessageTable?> searchMessageByText(String query) =>
      (select(messageTables)..where((tbl) => tbl.message.contains(query)))
          .getSingleOrNull();
  Future<List<MessageTable>> getUnsentMessages(int userId) =>
      (select(messageTables)
            ..where((tbl) =>
                tbl.userId.equals(userId) &
                (tbl.status.equals(MessageStatus.ERROR.index) |
                    tbl.status.equals(MessageStatus.SENDING.index)))
            ..orderBy([
              (t) => OrderingTerm(expression: t.created, mode: OrderingMode.asc)
            ]))
          .get();
  Stream<List<MessageWithUser>> watchChatMessages(String chatId,
      {OrderingMode orderMode = OrderingMode.asc, int? limit}) {
    final sel = (select(messageTables)
      ..where((tbl) => tbl.chatId.equals(chatId))
      ..orderBy(
        [(t) => OrderingTerm(expression: t.created, mode: orderMode)],
      ));

    if (limit != null) {
      sel..limit(limit);
    }
    return sel
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
  Future<List<UserTable>> getAllUsers() => select(userTables).get();
  Future<int> insertUser(UserTable user) => into(userTables).insert(user);
  Future<void> insertMultipleUsers(List<UserTable> users) async {
    await batch((batch) {
      batch.insertAll(
        userTables,
        users.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<int> updateUser(int id, UserTable user) =>
      (update(userTables)..where((tbl) => tbl.id.equals(id))).write(user);
  Future<UserTable?> selectUserById(int id) =>
      (select(userTables)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Stream<UserTable?> watchUser(int userId) =>
      (select(userTables)..where((tbl) => tbl.id.equals(userId)))
          .watchSingleOrNull();

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
  Future deleteChannelByChannelName(String channelName) =>
      (delete(channelTables)..where((tbl) => tbl.to.equals(channelName))).go();

  /// PARTICIPANTS
  Future<List<ParticipantTable>> getAllParticipants() =>
      select(participantTables).get();
  Future<int> insertParticipant(ParticipantTable participant) =>
      into(participantTables).insert(participant);
  Future<void> insertMultipleParticipants(
      List<ParticipantTable> participants) async {
    await batch((batch) {
      batch.insertAll(
        participantTables,
        participants.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future deleteParticipant(int userId, String chatId) => (delete(
          participantTables)
        ..where((tbl) => tbl.userId.equals(userId) & tbl.chatId.equals(chatId)))
      .go();
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

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  //USED TO AVOID APP CRASH AFTER CHANGING DB
  @override
  int get schemaVersion => 34;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {},
      );
}
