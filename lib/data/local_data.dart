import 'package:olinio_test/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static String contactsTable = 'contacts';

  static Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    String dbPath = join(path, 'olinio.db');
    return await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $contactsTable (name TEXT, surname TEXT, phone TEXT PRIMARY KEY, email TEXT, countryCode TEXT)');
    });
  }

  static Future<List<Map<String, dynamic>>> readData() async {
    final db = await initDatabase();
    return db.query(contactsTable);
  }

  static Future<bool> writeData(Contact data) async {
    final db = await initDatabase();
    final num = await db.insert(contactsTable, data.toJsonWithOnlyCountryCode(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    if (num == 0) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> deleteData(List<String> phones) async {
    final db = await initDatabase();
    final result =
        await db.delete(contactsTable, where: 'phone = ?', whereArgs: phones);
    if (result == 0) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> updateData(Contact contact) async {
    final db = await initDatabase();
    final num = await db.update(
        contactsTable, contact.toJsonWithOnlyCountryCode(),
        where: 'phone = ?', whereArgs: [contact.phone]);
    if (num == 0) {
      return false;
    } else {
      return true;
    }
  }
}
