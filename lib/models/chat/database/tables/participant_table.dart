import 'package:moor/moor.dart';

@DataClassName('ParticipantTable')
class ParticipantTables extends Table {
  TextColumn get chatId => text()();
  IntColumn get userId => integer()();
  BoolColumn get admin => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {chatId, userId};
}
