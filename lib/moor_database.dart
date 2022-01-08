import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 3, max: 25)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
}

@UseMoor(tables: [Tasks], daos: [TaskDao])
class MyDatabase extends _$MyDatabase  {
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;
}

@UseDao(
  tables: [Tasks],
  queries: {
    'getCategoryOneTasks': 'SELECT * FROM Tasks WHERE category = 1 ORDER BY title ASC;'
  },
)
class TaskDao extends DatabaseAccessor<MyDatabase> with _$TaskDaoMixin {

  final MyDatabase db;
  TaskDao(this.db) : super(db);

  Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<Task>> watchAllTasks() => select(tasks).watch();
  // Stream<List<Task>> getCategoryOneTasks() => (select(tasks)
  //     ..orderBy([
  //         (t) => OrderingTerm(expression: t.title, mode: OrderingMode.asc),
  //     ])
  //     ..where((t) => t.category.equals(1)))
  //     .watch();

  Future<int> insertTask(Insertable<Task> task) => into(tasks).insert(task);
  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}