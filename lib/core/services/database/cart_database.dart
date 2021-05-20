import 'package:ecommerceapp/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ecommerceapp/model/cart_product_model.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCart(
        $colName TEXT NOT NULL,
        $colImage TEXT NOT NULL,
        $colQuantity INTEGER NOT NULL,
        $colPrice TEXT NOT NULL,
        $colId  TEXT NOT NULL)
      ''');
    });
  }

  insert(CartProductModel model) async {
    var db = await database;
    await db.insert(
      tableCart,
      model.toJston(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List> getAllProduct() async {
    var db = await database;
    List<Map> maps = await db.query(tableCart);

    return maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
  }

  updateProduct(CartProductModel model) async {
    var db = await database;
    return await db.update(
      tableCart,
      model.toJston(),
      where: '$colId = ?',
      whereArgs: [model.id],
    );
  }
}
