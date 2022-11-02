
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:contact/models/menu.dart';

class DBProvider {
  

  static Database? _database; //nombre del objeto
  static final DBProvider db = DBProvider._(); //instancia de la clase
  DBProvider._(); //metodo constructor privado

  Future<Database> get database async { //hay que esperar la respuesta
    if( _database != null) return _database!;

    _database = await initDB();

    return _database!; //crea la base de datos

  }

  Future<Database> initDB() async {
    //Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'carta.db' );
    

    //Creando base de datos

    return await openDatabase( //crea la tabla contact
      path,
      version: 1, //siempre se incrementa la version de la base de datos
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE menu (
            id INTEGER PRIMARY KEY,
            codigo TEXT,
            nombre TEXT,
            precio REAL,
            familia TEXT
          )
        ''');
      }
      );
  }

  Future<List <Menu>> getMenu() async {
    Database db = await database;
    final menu = await db.query('menu', orderBy: 'nombre');

    List<Menu> menuList = menu.isNotEmpty
        ? menu.map( (c) => Menu.fromJson(c) ).toList()
        : [];
     return menuList;
  }

  Future<int> insert(Menu menu) async{ //sentencia insert
    Database db = await database;
    return await db.insert('menu', menu.toJson());
  }

  Future<int> delete(int id) async { //sentencia delete
    Database db = await database;
    return await db.delete('menu', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Menu menu) async { //sentencia update
    Database db = await database;
    return await db.update('menu', menu.toJson(), where: 'id = ?', whereArgs: [menu.id]);
  }

}