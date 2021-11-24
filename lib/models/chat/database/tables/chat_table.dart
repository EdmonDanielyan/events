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
      dateTime().withDefault(Constant(new DateTime.now().toUtc()))();
  TextColumn get millisecondsSinceEpoch => text().nullable().withDefault(
      Constant(new DateTime.now().millisecondsSinceEpoch.toString()))();
  BoolColumn get notificationsOn =>
      boolean().nullable().withDefault(Constant(true))();
}
