import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:moor/moor.dart';

@DataClassName('MessageTable')
class MessageTableSchema extends Table {
  TextColumn get id => text()();

  IntColumn get userId => integer()();

  TextColumn get chatId => text()();

  TextColumn get message => text()();

  TextColumn get repliedMessageId => text().nullable()();

  IntColumn get sentStatus => intEnum<MessageSentStatus>()();

  IntColumn get actionsStatus => intEnum<MessageActions>()();

  BoolColumn get read => boolean().withDefault(Constant(false))();

  IntColumn get type => intEnum<StoredMessageType>()();

  DateTimeColumn get timestamp =>
      dateTime().withDefault(Constant(new DateTime.now())).nullable()();

  IntColumn get sequence =>
      integer().nullable().withDefault(const Constant(0))();
  TextColumn get messageToLower =>
      text().nullable().withDefault(Constant(""))();

  @override
  Set<Column> get primaryKey => {id, chatId};

  static Map<String, dynamic> toJson({required MessageTable message}) {
    final serializer = moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(message.id),
      'userId': serializer.toJson<int>(message.userId),
      'chatId': serializer.toJson<String>(message.chatId),
      'message': serializer.toJson<String>(message.message),
      'repliedMessageId': serializer.toJson<String?>(message.repliedMessageId),
      'sentStatus': message.sentStatus.index,
      'actionsStatus': message.actionsStatus.index,
      'read': serializer.toJson<bool>(message.read),
      'type': message.type.index,
      'timestamp': serializer.toJson<DateTime?>(message.timestamp),
      'sequence': serializer.toJson<int?>(message.sequence),
      'messageToLower': serializer.toJson<String?>(message.messageToLower),
    };
  }
}
