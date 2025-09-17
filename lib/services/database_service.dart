import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_project/models/search_history_model.dart';



class DatabaseService {
  static DatabaseService? _db;

  DatabaseService._();

  factory DatabaseService() {
    _db ??= DatabaseService._();
    return _db!;
  }

  Future<Database> get database async {
    var path = await getDatabasesPath();

    return await openDatabase(
      join(path, 'weather.db'),
      onCreate: (db, version) {
        db.execute(SearchHistoryModel.createTableQuery);
      },
      version: 1,
    );
  }

  Future<List<SearchHistoryModel>> fetchData() async {
    var db = await database;

    var data = await db.query(SearchHistoryModel.tableName);

    return data.map((e) => SearchHistoryModel.fromMap(e)).toList();
  }

  Future<bool> insertData(SearchHistoryModel modalClass) async {
    var db = await database;

    var isInserted = await db.insert(
      SearchHistoryModel.tableName,
      modalClass.toMap(),
    );

    return isInserted > 0;
  }

  Future<bool> deleteData(SearchHistoryModel modalClass) async {
    var db = await database;

    var isDeleted = await db.delete(
      SearchHistoryModel.tableName,
      where: '${SearchHistoryModel.columnId}=?',
      whereArgs: [modalClass.primaryKey],
    );

    return isDeleted > 0;
  }

  Future<bool> deleteAll() async {
    final db = await database;
    var isAllDeleted = await db.delete(SearchHistoryModel.tableName);
    print(isAllDeleted);
    return isAllDeleted > 0;
  }
}
