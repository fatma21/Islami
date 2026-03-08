import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'recent_suras.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            '''
          CREATE TABLE recent(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            suraNumber INTEGER,
            time INTEGER
          )
          '''
        );
      },
    );
  }

  Future<void> insertRecent(int suraNumber) async {
    final db = await database;

    int now = DateTime.now().millisecondsSinceEpoch;



    await db.delete(
      "recent",
      where: "suraNumber = ?",
      whereArgs: [suraNumber],
    );

    await db.insert(
      "recent",
      {
        "suraNumber": suraNumber,
        "time": now,
      },
    );
  }

  Future<List<int>> getRecentSuras() async {
    final db = await database;
    int now = DateTime.now().millisecondsSinceEpoch;
    int dayAgo = now - Duration(hours: 24).inMilliseconds;

    await db.delete(
      "recent",
      where: "time < ?",
      whereArgs: [dayAgo],
    );

    final result = await db.query(
      "recent",
      orderBy: "time DESC",
    );



    return result.map((e) => e["suraNumber"] as int).toList();
  }
}