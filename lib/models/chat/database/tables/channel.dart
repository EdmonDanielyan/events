import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:moor/moor.dart';

@DataClassName('ChannelTable')
class ChannelTables extends Table {
  TextColumn get id => text()();
  IntColumn get payloadType => intEnum<PayloadType>()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(new DateTime.now())).nullable()();
  BoolColumn get needAck => boolean()();
  TextColumn get from => text()();
  TextColumn get to => text()();
  TextColumn get sequence => text()();
  IntColumn get messageType => intEnum<MessageType>()();
}
