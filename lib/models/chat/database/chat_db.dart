import 'package:ink_mobile/models/chat/database/tables/admin_table.dart';
import 'package:ink_mobile/models/chat/database/tables/chat_table.dart';
import 'package:ink_mobile/models/chat/database/tables/message_table.dart';
import 'package:ink_mobile/models/chat/database/tables/participant_table.dart';
import 'package:ink_mobile/models/chat/database/tables/user_table.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:moor/moor.dart';
import 'package:encrypted_moor/encrypted_moor.dart';

part 'chat_db.g.dart';

@UseMoor(tables: [
  ChatTables,
  MessageTables,
  UserTables,
  AdminTables,
  ParticipantTables
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
          ..where((tbl) => tbl.name.like('%${query}%'))
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
  Future<int> insertChat(ChatTable chat) => into(chatTables).insert(chat);
  Future updateChat(ChatTable chat) => update(chatTables).replace(chat);
  Future deleteChat(ChatTable chat) => delete(chatTables).delete(chat);

  //MESSAGES
  Future<int> insertMessage(MessageTable messageTable) =>
      into(messageTables).insert(messageTable);
  Future<MessageTable?> searchMessageByText(String query) =>
      (select(messageTables)..where((tbl) => tbl.message.contains(query)))
          .getSingleOrNull();
  Stream<List<MessageTable>> chatMessages(int chatId) => (select(messageTables)
        ..where((tbl) => tbl.chatId.equals(chatId))
        ..orderBy(
            [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
      .watch();

  //USER
  Future<int> insertUser(UserTable user) => into(userTables).insert(user);
  Future<UserTable?> selectUserById(int id) =>
      (select(userTables)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Stream<UserTable> watchUser(int userId) =>
      (select(userTables)..where((tbl) => tbl.id.equals(userId))).watchSingle();

  @override
  int get schemaVersion => 6;
}
