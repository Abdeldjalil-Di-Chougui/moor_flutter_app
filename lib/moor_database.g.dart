// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TodoData extends DataClass implements Insertable<TodoData> {
  final int id;
  final String title;
  final String content;
  final int category;
  TodoData(
      {@required this.id,
      @required this.title,
      @required this.content,
      this.category});
  factory TodoData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return TodoData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body']),
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || content != null) {
      map['body'] = Variable<String>(content);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    return map;
  }

  TodoCompanion toCompanion(bool nullToAbsent) {
    return TodoCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory TodoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TodoData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<int>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<int>(category),
    };
  }

  TodoData copyWith({int id, String title, String content, int category}) =>
      TodoData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('TodoData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category);
}

class TodoCompanion extends UpdateCompanion<TodoData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int> category;
  const TodoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
  });
  TodoCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String content,
    this.category = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  static Insertable<TodoData> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> content,
    Expression<int> category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (category != null) 'category': category,
    });
  }

  TodoCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<int> category}) {
    return TodoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $TodoTable extends Todo with TableInfo<$TodoTable, TodoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String _alias;
  $TodoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedColumn<String> _title;
  @override
  GeneratedColumn<String> get title => _title ??= GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 25),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedColumn<String> _content;
  @override
  GeneratedColumn<String> get content =>
      _content ??= GeneratedColumn<String>('body', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedColumn<int> _category;
  @override
  GeneratedColumn<int> get category =>
      _category ??= GeneratedColumn<int>('category', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, category];
  @override
  String get aliasedName => _alias ?? 'todo';
  @override
  String get actualTableName => 'todo';
  @override
  VerificationContext validateIntegrity(Insertable<TodoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body'], _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoData map(Map<String, dynamic> data, {String tablePrefix}) {
    return TodoData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodoTable createAlias(String alias) {
    return $TodoTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TodoTable _todo;
  $TodoTable get todo => _todo ??= $TodoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todo];
}
