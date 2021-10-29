import 'package:moor/moor.dart';

@DataClassName('ParticipantTable')
class ParticipantTables extends Table {
  IntColumn get chatId => integer()();
  IntColumn get userId => integer()();
}
