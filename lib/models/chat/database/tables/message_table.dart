import 'package:ink_mobile/models/chat/message.dart';
import 'package:moor/moor.dart';

@DataClassName('MessageTable')
class MessageTables extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  IntColumn get chatId => integer()();
  TextColumn get message => text()();
  IntColumn get userId => integer()();
  BoolColumn get read => boolean().withDefault(Constant(false))();
  IntColumn get status => intEnum<MessageStatus>()();
  DateTimeColumn get created =>
      dateTime().withDefault(Constant(new DateTime.now())).nullable()();
}
