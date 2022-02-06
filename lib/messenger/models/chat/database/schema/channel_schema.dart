import 'package:moor/moor.dart';

@DataClassName('ChannelTable')
class ChannelTableSchema extends Table {
  TextColumn get id => text()();
  IntColumn get sequence => integer().withDefault(Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
