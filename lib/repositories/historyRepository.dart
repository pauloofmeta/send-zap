import 'package:send_zap/models/history.dart';
import 'package:send_zap/database.dart';

class HistoryRepository {
  HistoryRepository._();

  static final HistoryRepository rp = HistoryRepository._();

  create(History history) async {
    var id = await getNewId();
    final db = await DBProvider.db.database;
    return db.rawInsert(
      "insert into History (id, phone, description, message)"
      " values (?, ?, ?, ?)",
      [id, history.phone, history.description, history.message]);
  }

  delete(History history) async {
    final db = await DBProvider.db.database;
    return db.delete("History", where: "id = ?", whereArgs: [history.id]);
  }

  deleteAll() async {
    final db = await DBProvider.db.database;
    return db.rawDelete("delete * from History");
  }

  Future<History> getById(int id) async {
    final db = await DBProvider.db.database;
    var res = await db.query("History", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? History.formMap(res.first) : null;
  }

  Future<List<History>> getAll() async {
    final db = await DBProvider.db.database;
    var res = await db.query("History");
    return res.isNotEmpty ? res.map((e) => History.formMap(e)).toList() : [];
  }

  Future<int> getNewId() async {
    final db = await DBProvider.db.database;
    var table = await db.rawQuery("select MAX(id) + 1 as id from History");
    int id = table.first["id"];
    return id;
  }
}