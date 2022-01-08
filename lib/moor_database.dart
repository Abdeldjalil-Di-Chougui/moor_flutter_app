import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 3, max: 25)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
}

@UseMoor(tables: [Todo])
class MyDatabase extends _$MyDatabase  {
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));


}