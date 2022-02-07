import 'package:moor/moor.dart';

@DataClassName('UserTable')
class UserTableSchema extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 0, max: 150)();
  TextColumn get avatar => text()();

  @override
  Set<Column> get primaryKey => {id};
}