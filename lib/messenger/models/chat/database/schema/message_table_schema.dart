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
}
