// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String tagName;
  final String name;
  final DateTime dueDate;
  final bool completed;
  Task(
      {@required this.id,
      this.tagName,
      @required this.name,
      this.dueDate,
      @required this.completed});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Task(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      tagName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_name']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      dueDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      completed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || tagName != null) {
      map['tag_name'] = Variable<String>(tagName);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      tagName: tagName == null && nullToAbsent
          ? const Value.absent()
          : Value(tagName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      tagName: serializer.fromJson<String>(json['tagName']),
      name: serializer.fromJson<String>(json['name']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tagName': serializer.toJson<String>(tagName),
      'name': serializer.toJson<String>(name),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  Task copyWith(
          {int id,
          String tagName,
          String name,
          DateTime dueDate,
          bool completed}) =>
      Task(
        id: id ?? this.id,
        tagName: tagName ?? this.tagName,
        name: name ?? this.name,
        dueDate: dueDate ?? this.dueDate,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('tagName: $tagName, ')
          ..write('name: $name, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tagName, name, dueDate, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.tagName == this.tagName &&
          other.name == this.name &&
          other.dueDate == this.dueDate &&
          other.completed == this.completed);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> tagName;
  final Value<String> name;
  final Value<DateTime> dueDate;
  final Value<bool> completed;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.tagName = const Value.absent(),
    this.name = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    this.tagName = const Value.absent(),
    @required String name,
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Task> custom({
    Expression<int> id,
    Expression<String> tagName,
    Expression<String> name,
    Expression<DateTime> dueDate,
    Expression<bool> completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tagName != null) 'tag_name': tagName,
      if (name != null) 'name': name,
      if (dueDate != null) 'due_date': dueDate,
      if (completed != null) 'completed': completed,
    });
  }

  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> tagName,
      Value<String> name,
      Value<DateTime> dueDate,
      Value<bool> completed}) {
    return TasksCompanion(
      id: id ?? this.id,
      tagName: tagName ?? this.tagName,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tagName.present) {
      map['tag_name'] = Variable<String>(tagName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('tagName: $tagName, ')
          ..write('name: $name, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _tagNameMeta = const VerificationMeta('tagName');
  GeneratedColumn<String> _tagName;
  @override
  GeneratedColumn<String> get tagName =>
      _tagName ??= GeneratedColumn<String>('tag_name', aliasedName, true,
          type: const StringType(),
          requiredDuringInsert: false,
          $customConstraints: 'NULL REFERENCES tags(name)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedColumn<String> _name;
  @override
  GeneratedColumn<String> get name => _name ??= GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  GeneratedColumn<DateTime> _dueDate;
  @override
  GeneratedColumn<DateTime> get dueDate =>
      _dueDate ??= GeneratedColumn<DateTime>('due_date', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedColumn<bool> _completed;
  @override
  GeneratedColumn<bool> get completed =>
      _completed ??= GeneratedColumn<bool>('completed', aliasedName, false,
          type: const BoolType(),
          requiredDuringInsert: false,
          defaultConstraints: 'CHECK (completed IN (0, 1))',
          defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, tagName, name, dueDate, completed];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('tag_name')) {
      context.handle(_tagNameMeta,
          tagName.isAcceptableOrUnknown(data['tag_name'], _tagNameMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date'], _dueDateMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed'], _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    return Task.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TaskDaoMixin on DatabaseAccessor<MyDatabase> {
  $TasksTable get tasks => attachedDatabase.tasks;
  Selectable<Task> getCategoryOneTasks() {
    return customSelect(
        'SELECT * FROM Tasks WHERE category = 1 ORDER BY title ASC;',
        variables: [],
        readsFrom: {
          tasks,
        }).map(tasks.mapFromRow);
  }
}
