import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 3, max: 25)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
}

@UseMoor(tables: [Tasks])
class MyDatabase extends _$MyDatabase  {
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<Task>> watchAllTasks() => select(tasks).watch();

  Future<int> insertTask(task) => into(tasks).insert(task);
  Future updateTask(task) => update(tasks).replace(task);
  Future deleteTask(task) => delete(tasks).delete(task);
}