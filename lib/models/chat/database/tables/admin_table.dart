import 'package:moor/moor.dart';

@DataClassName('AdminTable')
class AdminTables extends Table {
  IntColumn get chatId => integer()();
  IntColumn get userId => integer()();
}
