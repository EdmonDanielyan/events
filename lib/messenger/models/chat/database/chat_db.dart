import 'dart:async';

import 'package:encrypted_moor/encrypted_moor.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/channel_schema.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/chat_table_schema.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/message_table_schema.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/participant_table_schema.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/user_table_schema.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:moor/moor.dart';

import 'model/chat_with_message.dart';
import 'model/participant_with_user.dart';

part 'chat_db.g.dart';

@lazySingleton
@UseMoor(tables: [
  ChatTableSchema,
  MessageTableSchema,
  UserTableSchema,
  ParticipantTableSchema,
  ChannelTableSchema
])
class ChatDatabase extends _$ChatDatabase with Loggable {
  ChatDatabase(@Named("localDatabasePassword") String localDatabasePassword,
      @Named("userId") String userId)
      : super(
          EncryptedExecutor.inDatabaseFolder(
              path: "chat_db_$userId.sqlite",
              password: localDatabasePassword,
              logStatements: false //kDebugMode,
              ),
        );

  //CHATS
  Future<ChatTable?> selectChatById(String chatId) =>
      (select(chatTableSchema)..where((tbl) => tbl.id.equals(chatId)))
          .getSingleOrNull();

  Future<ChatTable?> selectChatByParticipantId(int participantId) =>
      (select(chatTableSchema)
            ..where((tbl) => tbl.participantId.equals(participantId)))
          .getSingleOrNull();

  Future<List<ChatTable>> getAllChats() => select(chatTableSchema).get();

  Stream<List<ChatTable>> searchChats(String query) {
    return (select(chatTableSchema)
          ..where((tbl) => tbl.name.like('%$query%'))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Stream<List<ChatTable>> watchAllChats() {
    final _debouncer = Debouncer(milliseconds: 300);
    return (select(chatTableSchema)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc)
          ]))
        .watch()
        .transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
      _debouncer.run(() {
        sink.add(data);
      });
    }));
  }

  Stream<List<ChatWithMessage>> watchAllChatsWithMessagesJoin() {
    final sel = (select(chatTableSchema)).join([
      leftOuterJoin(messageTableSchema,
          messageTableSchema.chatId.equalsExp(chatTableSchema.id))
    ]);

    sel.orderBy([OrderingTerm.desc(messageTableSchema.timestamp)]);
    sel.groupBy([chatTableSchema.id]);

    final _debouncer = Debouncer(milliseconds: 300);

    return sel.watch().map((rows) {
      return rows.map((row) {
        return ChatWithMessage(
          message: row.readTableOrNull(messageTableSchema),
          chat: row.readTableOrNull(chatTableSchema),
        );
      }).toList();
    }).transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
      _debouncer.run(() {
        sink.add(data);
      });
    }));
  }

  Stream<ChatTable> watchChatById(String id) =>
      (select(chatTableSchema)..where((tbl) => tbl.id.equals(id)))
          .watchSingle();

  Future<int> insertChat(ChatTable chat) =>
      into(chatTableSchema).insert(chat, mode: InsertMode.insertOrReplace);

  Future<void> insertMultipleChats(List<ChatTable> chats) async {
    await batch((batch) {
      batch.insertAll(
        chatTableSchema,
        chats.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future updateChatById(String id, ChatTable chat) =>
      (update(chatTableSchema)..where((tbl) => tbl.id.equals(id)))
          .write(chat)
          .catchError((_e) {
        logger.severe("Sql migration error. Please, reinstall the app.", _e);
      });

  Future deleteChat(ChatTable chat) => delete(chatTableSchema).delete(chat);

  Future deleteChatById(String id) =>
      (delete(chatTableSchema)..where((tbl) => tbl.id.equals(id))).go();

  //MESSAGES
  Stream<List<MessageTable>> watchAllMessages() =>
      (select(messageTableSchema)).watch();

  Future<List<MessageTable>> getAllMessagesBySort() =>
      (select(messageTableSchema)
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.sequence, mode: OrderingMode.desc),
            ]))
          .get();
  Future<List<MessageTable>> getAllMessages() =>
      select(messageTableSchema).get();

  Future<MessageTable?> selectMessageById(String id) =>
      (select(messageTableSchema)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future<MessageTable?> selectMessageByChatIdInOrder(
          String id, OrderingMode orderingMode) =>
      (select(messageTableSchema)
            ..where(
              (tbl) => tbl.id.equals(id),
            )
            ..orderBy([
              (t) => OrderingTerm(expression: t.sequence, mode: orderingMode),
            ]))
          .getSingleOrNull();

  Future<MessageTable?> selectMessageByChatIdInSeqOrder(String id) =>
      (select(messageTableSchema)
            ..where(
              (tbl) => tbl.chatId.equals(id),
            )
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.sequence, mode: OrderingMode.desc),
            ])
            ..limit(1))
          .getSingleOrNull();

  Future<List<MessageTable>> selectMessagesByUserAndChatId(
          String chatId, int userId) =>
      (select(messageTableSchema)
            ..where(
                (tbl) => tbl.chatId.equals(chatId) & tbl.userId.equals(userId)))
          .get();

  Future<int> updateMessageById(String id, MessageTable message) =>
      (update(messageTableSchema)..where((tbl) => tbl.id.equals(id)))
          .write(message);

  Future<void> updateMessagesReadStatus(
      MessageTable message, int exceptUserId, bool read) async {
    (update(messageTableSchema)
          ..where((tbl) =>
              tbl.chatId.equals(message.chatId) &
              tbl.userId.equals(exceptUserId).not() &
              tbl.read.equals(false)))
        .write(
      MessageTableSchemaCompanion(read: Value(true)),
    );
  }

  Future<int> countUnreadMessages(String id) async {
    var count = countAll(
        filter: messageTableSchema.id.equals(id) &
            messageTableSchema.type.isIn([
              StoredMessageType.TEXT.index,
              StoredMessageType.DOCUMENT.index
            ]) &
            messageTableSchema.read.equals(true));
    var res = await (selectOnly(messageTableSchema)..addColumns([count]))
        .map((row) => row.read(count))
        .getSingle();
    return res;
  }

  Future<int> insertMessage(MessageTable messageTable) =>
      into(messageTableSchema)
          .insert(messageTable, mode: InsertMode.insertOrReplace);

  Future<void> insertMultipleMessages(List<MessageTable> messages) async {
    await batch((batch) {
      batch.insertAll(
        messageTableSchema,
        messages.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<MessageTable?> searchMessageByText(String query) =>
      (select(messageTableSchema)..where((tbl) => tbl.message.contains(query)))
          .getSingleOrNull();

  Future<MessageTable?> searchMessageByTextAndChatId(
          String query, String chatId) =>
      (select(messageTableSchema)
            ..where((tbl) =>
                tbl.messageToLower.contains(query) & tbl.chatId.equals(chatId))
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.sequence, mode: OrderingMode.desc),
            ])
            ..limit(1))
          .getSingleOrNull();

  Future<List<MessageTable>> getUnsentMessages(int userId,
          {OrderingMode orderingMode = OrderingMode.asc}) =>
      (select(messageTableSchema)
            ..where((tbl) =>
                tbl.userId.equals(userId) &
                (tbl.sentStatus.equals(MessageSentStatus.ERROR.index) |
                    tbl.sentStatus.equals(MessageSentStatus.SENDING.index)))
            ..orderBy([
              (t) => OrderingTerm(expression: t.sequence, mode: orderingMode),
              (t) => OrderingTerm(expression: t.timestamp, mode: orderingMode),
            ]))
          .get();

  Stream<List<MessageWithUser>> watchChatMessages(String chatId,
      {OrderingMode orderMode = OrderingMode.asc, int? limit}) {
    final sel = (select(messageTableSchema)
          ..where((tbl) => tbl.chatId.equals(chatId)))
        .join([
      leftOuterJoin(userTableSchema,
          userTableSchema.id.equalsExp(messageTableSchema.userId))
    ]);
    sel.orderBy([
      orderMode == OrderingMode.asc
          ? OrderingTerm.asc(messageTableSchema.sequence)
          : OrderingTerm.desc(messageTableSchema.sequence),
    ]);

    Debouncer _debouncer = Debouncer(milliseconds: 300);

    if (limit != null) {
      sel..limit(limit);
    }
    return sel.watch().map((rows) {
      return rows.map((row) {
        return MessageWithUser(
          message: row.readTableOrNull(messageTableSchema),
          user: row.readTableOrNull(userTableSchema),
        );
      }).toList();
    }).transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
      _debouncer.run(() {
        sink.add(data);
      });
    }));
  }

  Stream<List<MessageWithUser>> watchChatFilesMessages(String chatId) {
    return (select(messageTableSchema)
          ..where((tbl) =>
              tbl.chatId.equals(chatId) & (tbl.message.contains("http")))
          ..orderBy([
            (t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.asc)
          ]))
        .join([
          leftOuterJoin(userTableSchema,
              userTableSchema.id.equalsExp(messageTableSchema.userId))
        ])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return MessageWithUser(
              message: row.readTableOrNull(messageTableSchema),
              user: row.readTableOrNull(userTableSchema),
            );
          }).toList();
        });
  }

  Future<List<MessageWithUser>> getChatMessages(String chatId) async {
    return await (select(messageTableSchema)
          ..where((tbl) => tbl.chatId.equals(chatId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.asc)
          ]))
        .join([
          leftOuterJoin(userTableSchema,
              userTableSchema.id.equalsExp(messageTableSchema.userId))
        ])
        .get()
        .then((rows) {
          return rows.map((row) {
            return MessageWithUser(
              message: row.readTableOrNull(messageTableSchema),
              user: row.readTableOrNull(userTableSchema),
            );
          }).toList();
        });
  }

  Future deleteMessagesByChatId(String chatId) =>
      (delete(messageTableSchema)..where((tbl) => tbl.chatId.equals(chatId)))
          .go();

  Future deleteMessageById(String id) =>
      (delete(messageTableSchema)..where((tbl) => tbl.id.equals(id))).go();

  //USER
  Future<List<UserTable>> getAllUsers() => select(userTableSchema).get();

  Future<int> insertUserOrUpdate(UserTable user) => into(userTableSchema)
          .insert(user, mode: InsertMode.insertOrReplace)
          .onError((error, stackTrace) {
        logger.warning("ERROR INSERTING USER ${error.toString()}");

        return Future.value(0);
      });

  Future<void> insertMultipleUsers(List<UserTable> users) async {
    await batch((batch) {
      batch.insertAll(
        userTableSchema,
        users.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<int> updateUser(int id, UserTable user) =>
      (update(userTableSchema)..where((tbl) => tbl.id.equals(id))).write(user);

  Future<UserTable?> selectUserById(int id) =>
      (select(userTableSchema)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future<int> countMessagesByTypeChatUser(
      String chatId, int userId, StoredMessageType type) async {
    var count = countAll(
        filter: messageTableSchema.chatId.equals(chatId) &
            messageTableSchema.userId.equals(userId) &
            messageTableSchema.type.equals(type.index));
    var res = await (selectOnly(messageTableSchema)..addColumns([count]))
        .map((row) => row.read(count))
        .getSingle();
    return res;
  }

  Stream<UserTable?> watchUser(int userId) =>
      (select(userTableSchema)..where((tbl) => tbl.id.equals(userId)))
          .watchSingleOrNull();

  //CHANNEL
  Future<List<ChannelTable>> getAllChannels() =>
      select(channelTableSchema).get();

  Future<ChannelTable?> getChannelById(String id) =>
      (select(channelTableSchema)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future<int> insertChannel(ChannelTable channel) => into(channelTableSchema)
      .insert(channel, mode: InsertMode.insertOrReplace);

  Future<int> updateChannelById(String id, ChannelTable channel) =>
      (update(channelTableSchema)..where((tbl) => tbl.id.equals(id)))
          .write(channel);

  Future deleteChannelById(String id) =>
      (delete(channelTableSchema)..where((tbl) => tbl.id.equals(id))).go();

  /// PARTICIPANTS
  Future<List<ParticipantTable>> getAllParticipants() =>
      select(participantTableSchema).get();

  Future<int> insertParticipantOrUpdate(ParticipantTable participant) =>
      into(participantTableSchema)
          .insert(participant, mode: InsertMode.insertOrReplace);

  Future<void> insertMultipleParticipants(
      List<ParticipantTable> participants) async {
    await batch((batch) {
      batch.insertAll(
        participantTableSchema,
        participants.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future deleteParticipant(int userId, String chatId) => (delete(
          participantTableSchema)
        ..where((tbl) => tbl.userId.equals(userId) & tbl.chatId.equals(chatId)))
      .go();

  Future<void> deleteParticipants(List<int> userIds, String chatId) async {
    (delete(participantTableSchema)
          ..where(
              (tbl) => tbl.userId.isIn(userIds) & tbl.chatId.equals(chatId)))
        .go();
  }

  Future<ParticipantTable?> selectParticipantById(int id, String chatId) =>
      (select(participantTableSchema)
            ..where((tbl) => tbl.userId.equals(id) & tbl.chatId.equals(chatId)))
          .getSingleOrNull();

  Stream<List<ParticipantWithUser>> watchParticipants(String chatId) {
    return (select(participantTableSchema)
          ..where((tbl) => tbl.chatId.equals(chatId)))
        .join([
          leftOuterJoin(userTableSchema,
              userTableSchema.id.equalsExp(participantTableSchema.userId))
        ])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return ParticipantWithUser(
              participant: row.readTableOrNull(participantTableSchema),
              user: row.readTableOrNull(userTableSchema),
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
  int get schemaVersion => 41;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {},
      );
}
