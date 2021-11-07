import 'package:moor/moor.dart';

@DataClassName('ParticipantTable')
class ParticipantTables extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get chatId => text()();
  IntColumn get userId => integer()();
  BoolColumn get admin => boolean().withDefault(Constant(false))();
}
