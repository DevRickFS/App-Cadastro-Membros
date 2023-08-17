import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  Future get database async{
    if (_database != null) return _database;

    return await _initRepository();
  }

  Future _initRepository() async {
      return await openDatabase(
        join(await getDatabasesPath(), 'listMembros.db'),
        version: 1,
        onCreate: _onCreate,
      );
  }

  _onCreate(db, versao) async {
    await db.execute(_membros);
  }

  String get _membros =>  '''
    CREATE TABLE membros (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      sobrenome TEXT,
      cargo TEXT,
      email TEXT,
      Telefone TEXT
    );
 ''';
}