import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Tasks extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tagName =>
      text().nullable().customConstraint('NULL REFERENCES tags(name)')();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();
}

class Tags extends Table {
  TextColumn get name => text().withLength(min: 1, max: 10)();
  IntColumn get color => integer()();

  @override
  Set<Column> get primaryKey => {name};
}

class TaskWithTag {
  final Task task;
  final Tag tag;

  TaskWithTag({
    @required this.task,
    @required this.tag,
  });
}

@UseMoor(tables: [Tasks, Tags], daos: [TaskDao])
class MyDatabase extends _$MyDatabase  {
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from == 1) {
        await migrator.addColumn(tasks, tasks.tagName);
        await migrator.createTable(tags);
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

@UseDao(
  tables: [Tasks, Tags],
  queries: {
    'getCategoryOneTasks': 'SELECT * FROM Tasks WHERE completed = 1 ORDER BY due_date ASC;'
  },
)
class TaskDao extends DatabaseAccessor<MyDatabase> with _$TaskDaoMixin {

  final MyDatabase db;
  TaskDao(this.db) : super(db);

  Future<List<Task>> getAllTasks() => select(tasks).get();
  // Stream<List<Task>> watchAllTasks() => select(tasks).watch();
  // Stream<List<Task>> getCategoryOneTasks() => (select(tasks)
  //     ..orderBy([
  //         (t) => OrderingTerm(expression: t.title, mode: OrderingMode.asc),
  //     ])
  //     ..where((t) => t.category.equals(1)))
  //     .watch();

  Stream<List<TaskWithTag>> watchAllTasks() {
    return (select(tasks)
      ..orderBy(
        [
              (t) =>
              OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.name),
        ],
      ))
        .join(
      [
        leftOuterJoin(tags, tags.name.equalsExp(tasks.tagName)),
      ],
    )
        .watch()
        .map((rows) => rows.map(
          (row) {
        return TaskWithTag(
          task: row.readTable(tasks),
          tag: row.readTable(tags),
        );
      },
    ).toList());
  }

  Future<int> insertTask(Insertable<Task> task) => into(tasks).insert(task);
  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}

@UseDao(tables: [Tags])
class TagDao extends DatabaseAccessor<MyDatabase> with _$TagDaoMixin {
  final MyDatabase db;

  TagDao(this.db) : super(db);

  Stream<List<Tag>> watchTags() => select(tags).watch();
  Future insertTag(Insertable<Tag> tag) => into(tags).insert(tag);
}