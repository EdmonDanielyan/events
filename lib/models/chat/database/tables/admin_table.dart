import 'package:moor/moor.dart';

@DataClassName('AdminTable')
class AdminTables extends Table {
  TextColumn get chatId => text()();
  IntColumn get userId => integer()();
}
