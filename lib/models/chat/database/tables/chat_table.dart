import 'package:moor/moor.dart';

@DataClassName('ChatTable')
class ChatTables extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 0, max: 150)();
  TextColumn get description => text()();
  TextColumn get avatar => text()();
  IntColumn get ownerId => integer()();
  IntColumn get participantId => integer().nullable()();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(Constant(DateTime.now().toUtc()))();
  TextColumn get millisecondsSinceEpoch => text().nullable().withDefault(
      Constant(DateTime.now().millisecondsSinceEpoch.toString()))();
  BoolColumn get notificationsOn =>
      boolean().nullable().withDefault(Constant(true))();
  BoolColumn get unreadCounterOn =>
      boolean().nullable().withDefault(Constant(true))();
  BoolColumn get deleted => boolean().nullable().withDefault(Constant(false))();
  IntColumn get lastMessageSeq => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
