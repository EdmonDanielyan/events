import 'dart:async';
import 'dart:io';

import 'package:encrypted_moor/encrypted_moor.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/channel_schema.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/chat_table_schema.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/message_table_schema.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/participant_table_schema.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/user_table_schema.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:moor/moor.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

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

  Map<String, ChatTable> chatCache = {};
  Map<int, UserTable> userCache = {};
  Map<String, MessageTable> messageCache = {};

  //CHATS
  Future<ChatTable?> selectChatById(String chatId) async {
    ChatTable? chat = chatCache[chatId];
    if (chat == null) {
      chat = (await (select(chatTableSchema)..where((tbl) => tbl.id.equals(chatId)))
          .getSingleOrNull());
      if (chat != null) chatCache[chatId] = chat;
    }

    return chat;
  }

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

  Stream<List<ChatTable>> watchAllChats(
      {void Function(List<ChatTable>, EventSink<List<ChatTable>>)?
          handleData}) {
    final _debouncer = Debouncer(milliseconds: 100);
    return (select(chatTableSchema)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc)
          ]))
        .watch()
        .transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
      if (handleData != null) {
        handleData(data, sink);
      } else {
        _debouncer.run(() {
          sink.add(data);
        });
      }
    }));
  }

  Stream<ChatTable> watchChatById(String id) =>
      (select(chatTableSchema)..where((tbl) => tbl.id.equals(id)))
          .watchSingle();

  Future<int> insertChat(ChatTable chat) async {
    var adjustedChat = await adjustChatParameters(chat);
    chatCache[chat.id] = adjustedChat;
    return into(chatTableSchema).insert(adjustedChat, mode: InsertMode.insertOrReplace);
  }

  Future<void> insertMultipleChats(List<ChatTable> chats) async {
    List<ChatTable> _chats = [];

    for (var c in chats) {
      var adjustedChat = await adjustChatParameters(c);
      _chats.add(adjustedChat);
      chatCache[c.id] = adjustedChat;
    }

    _chats.forEach((element) => chatCache[element.id] = element);
    await batch((batch) {
      batch.insertAll(
        chatTableSchema,
        _chats.map((e) => e.toCompanion(true)).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> updateChat(ChatTable chat) async {
    var adjustedChat = await adjustChatParameters(chat);
    chatCache[chat.id] = adjustedChat;
    await (update(chatTableSchema)..where((tbl) => tbl.id.equals(chat.id)))
          .write(adjustedChat)
          .catchError((_e) {
        logger.severe("Sql migration error. Please, reinstall the app.", _e);
      });
  }

  Future<void> updateChatTime(String chatId, DateTime date) {
    chatCache.remove(chatId);
    return (update(chatTableSchema)..where((tbl) => tbl.id.equals(chatId)))
          .write(
        ChatTableSchemaCompanion(updatedAt: Value(date)),
      )
          .catchError((_e) {
        logger.severe("Sql migration error. Please, reinstall the app.", _e);
      });
  }

  Future deleteChat(ChatTable chat) {
    chatCache.remove(chat.id);
    return delete(chatTableSchema).delete(chat);
  }

  Future deleteChatById(String id) {
    chatCache.remove(id);
    return (delete(chatTableSchema)..where((tbl) => tbl.id.equals(id))).go();
  }

  //MESSAGES
  Stream<List<MessageTable>> watchAllMessages() {
    Debouncer _debouncer = Debouncer(milliseconds: 300);
    return (select(messageTableSchema))
        .watch()
        .transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
      _debouncer.run(() {
        try {
          sink.add(data);
        } catch (ignore) {
        }
      });
    }));
  }

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

  Future<List<MessageTable>?> getLastMessages(String chatId, int limit) =>
      (select(messageTableSchema)
            ..where(
              (tbl) => tbl.chatId.equals(chatId),
            )
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.sequence, mode: OrderingMode.desc),
            ])
            ..limit(limit))
          .get();

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

  Future<ChatTable> adjustChatParameters(ChatTable chat) async {
    logger.finest("adjustChatParameters");
    if (chat.isGroup()) return chat;

    int oppositeId = chat.ownerId == JwtPayload.myId ? chat.participantId! : chat.ownerId;
    var oppositeUser = await selectUserById(oppositeId);
    var chatName = oppositeUser!.name;
    var avatar = oppositeUser.avatar;
    var result = chat.copyWith(ownerId: JwtPayload.myId, avatar: avatar, name: chatName, participantId: oppositeId);
    logger.finest(()=>"adjustChatParameters result: $result");
    return result;
  }

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

  Future<void> updateMessageListReadStatus(
      List<String> chats) async {
    (update(messageTableSchema)
          ..where((tbl) =>
              tbl.chatId.isIn(chats) &
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

  Future<MessageWithUser?> searchMessageWithUserByTextAndChatId(
      String query, String chatId) async {
    final msg = await (select(messageTableSchema)
          ..where((tbl) =>
              tbl.messageToLower.contains(query) & tbl.chatId.equals(chatId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sequence, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .join([
      leftOuterJoin(userTableSchema,
          userTableSchema.id.equalsExp(messageTableSchema.userId))
    ]).getSingleOrNull();

    return msg != null
        ? MessageWithUser(
            message: msg.readTableOrNull(messageTableSchema),
            user: msg.readTableOrNull(userTableSchema),
          )
        : null;
  }

  Future<List<MessageTable>> getUnsentMessages(int userId,
          {OrderingMode orderingMode = OrderingMode.asc}) =>
      (select(messageTableSchema)
            ..where((tbl) =>
                tbl.userId.equals(userId) &
                (tbl.sentStatus.equals(MessageSentStatus.ERROR.index) |
                    tbl.sentStatus.equals(MessageSentStatus.SENDING.index)))
            ..orderBy([
              (t) => OrderingTerm(expression: t.sequence, mode: orderingMode),
            ]))
          .get();

  Future<MessageTable?> getLastUnsentMsg(String chatId) =>
      (select(messageTableSchema)
            ..where((tbl) =>
                tbl.chatId.equals(chatId) &
                (tbl.sentStatus.equals(MessageSentStatus.ERROR.index) |
                    tbl.sentStatus.equals(MessageSentStatus.SENDING.index)))
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.sequence, mode: OrderingMode.desc),
            ])
            ..limit(1))
          .getSingleOrNull();

  Future<List<MessageTable>> getErrorMessages(int userId,
          {OrderingMode orderingMode = OrderingMode.asc}) =>
      (select(messageTableSchema)
            ..where((tbl) =>
                tbl.userId.equals(userId) &
                (tbl.sentStatus.equals(MessageSentStatus.ERROR.index)))
            ..orderBy([
              (t) => OrderingTerm(expression: t.sequence, mode: orderingMode),
            ]))
          .get();

  Stream<List<MessageWithUser>> watchChatMessages(
    String chatId, {
    OrderingMode orderMode = OrderingMode.asc,
    int? limit,
    void Function(List<MessageWithUser>, EventSink<List<MessageWithUser>>)?
        handleData,
  }) {
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

    Debouncer _debouncer = Debouncer(milliseconds: 150);

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
    }).transform(
      StreamTransformer.fromHandlers(
        handleData: handleData != null
            ? handleData
            : (data, sink) {
                _debouncer.run(() {
                  sink.add(data);
                });
              },
      ),
    );
  }

  Stream<List<MessageWithUser>> watchChatFilesMessages(String chatId) {
    return (select(messageTableSchema)
          ..where((tbl) =>
              tbl.chatId.equals(chatId) & (tbl.message.contains("http")))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sequence, mode: OrderingMode.desc)
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

  Future<int> insertUserOrUpdate(UserTable user) {
    userCache[user.id] = user;
    return into(userTableSchema)
          .insert(user, mode: InsertMode.insertOrReplace)
          .onError((error, stackTrace) {
        logger.warning("ERROR INSERTING USER ${error.toString()}");

        return Future.value(0);
      });
  }

  Future<void> insertMultipleUsers(List<UserTable> users) async {
    await batch((batch) {
      batch.insertAll(
        userTableSchema,
        users.map((e) {
          userCache[e.id] = e;
          return e.toCompanion(true);
        }).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<int> updateUser(int id, UserTable user) {
    userCache[id] = user;
    return (update(userTableSchema)..where((tbl) => tbl.id.equals(id))).write(user);
  }

  Future<UserTable?> selectUserById(int id) async {
    UserTable? user = userCache[id];
    if (user == null) {
      user = await (select(userTableSchema)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    }

    if (user != null) userCache[id] = user;
    return user;
  }

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
    clearCache();
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  Future<void> deleteDatabaseFiles() async {
    clearCache();
    await close();

    String path = await getDatabasesPath();
    final regExp = RegExp(r'.*[.]sqlite');
    Directory(path)
        .list()
        .where((file) => regExp.hasMatch(file.path))
        .forEach((file) {
      logger.finest("Delete file: ${file.path}");
      file.deleteSync();
    });
  }

  //USED TO AVOID APP CRASH AFTER CHANGING DB
  @override
  int get schemaVersion => 42;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
        },
      );

  void clearCache() {
    messageCache = {};
    chatCache = {};
    userCache = {};
  }
}
