import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:moor/moor.dart';

@DataClassName('MessageTable')
class MessageTables extends Table {
  TextColumn get id => text()();
  TextColumn get chatId => text()();
  TextColumn get message => text()();
  IntColumn get userId => integer()();
  TextColumn get repliedMessageId => text().nullable()();
  BoolColumn get read => boolean().withDefault(Constant(false))();
  BoolColumn get sentOn => boolean().withDefault(Constant(false))();
  IntColumn get status => intEnum<MessageStatus>()();
  IntColumn get type => intEnum<MessageType>()();
  IntColumn get created =>
      integer().withDefault(Constant(DateTime.now().millisecondsSinceEpoch)).nullable()();
  IntColumn get sequence =>
      integer().nullable().withDefault(const Constant(0))();
  BoolColumn get edited => boolean().nullable().withDefault(Constant(false))();
  TextColumn get messageToLower =>
      text().nullable().withDefault(Constant(""))();

  @override
  Set<Column> get primaryKey => {id, chatId};
}
