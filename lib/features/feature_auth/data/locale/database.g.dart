// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorUserDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDataBaseBuilder databaseBuilder(String name) =>
      _$UserDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$UserDataBaseBuilder(null);
}

class _$UserDataBaseBuilder {
  _$UserDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$UserDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$UserDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<UserDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UserDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDataBase extends UserDataBase {
  _$UserDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userdaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserInfo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `family` TEXT NOT NULL, `phone` TEXT NOT NULL, `password` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userdao {
    return _userdaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInfoInsertionAdapter = InsertionAdapter(
            database,
            'UserInfo',
            (UserInfo item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'family': item.family,
                  'phone': item.phone,
                  'password': item.password
                }),
        _userInfoDeletionAdapter = DeletionAdapter(
            database,
            'UserInfo',
            ['id'],
            (UserInfo item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'family': item.family,
                  'phone': item.phone,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserInfo> _userInfoInsertionAdapter;

  final DeletionAdapter<UserInfo> _userInfoDeletionAdapter;

  @override
  Future<List<UserInfo>> findAllUserWithDevice() async {
    return _queryAdapter.queryList('SELECT * FROM UserInfo',
        mapper: (Map<String, Object?> row) => UserInfo(
            id: row['id'] as int?,
            name: row['name'] as String,
            family: row['family'] as String,
            phone: row['phone'] as String,
            password: row['password'] as String));
  }

  @override
  Future<UserInfo?> findUserByPhoneAndPassword(
    String phone,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM UserInfo WHERE phone = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => UserInfo(
            id: row['id'] as int?,
            name: row['name'] as String,
            family: row['family'] as String,
            phone: row['phone'] as String,
            password: row['password'] as String),
        arguments: [phone, password]);
  }

  @override
  Future<UserInfo?> findUserByPhone(String phone) async {
    return _queryAdapter.query('SELECT * FROM UserInfo WHERE phone = ?1',
        mapper: (Map<String, Object?> row) => UserInfo(
            id: row['id'] as int?,
            name: row['name'] as String,
            family: row['family'] as String,
            phone: row['phone'] as String,
            password: row['password'] as String),
        arguments: [phone]);
  }

  @override
  Future<void> addUser(UserInfo user) async {
    await _userInfoInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(UserInfo user) async {
    await _userInfoDeletionAdapter.delete(user);
  }
}
