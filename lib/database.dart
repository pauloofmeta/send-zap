import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dir = await getApplicationDocumentsDirectory();
    var path = join(dir.path, 'SendZap.db');
    return await openDatabase(path, version: 1, onCreate: createTables);
  }

  Future<void> createTables(Database db, int version) async {
    await db.execute("CREATE TABLE History( "
      "id INTEGER PRIMARY KEY,"
      "phone TEXT,"
      "description TEXT,"
      "message TEXT"
      ")");
  }
}