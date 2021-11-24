import 'package:moor/moor.dart';

@DataClassName('UserTable')
class UserTables extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 0, max: 150)();
  TextColumn get avatar => text()();
  BoolColumn get online => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
