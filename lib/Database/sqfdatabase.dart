import 'dart:async';
import 'dart:core';


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Sqfdatamodel.dart';


class DbManager {
  late Database database;

  Future openDb() async {
    database = await openDatabase(join(await getDatabasesPath(), "ss.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE model(NumberofDiamond TEXT, Price TEXT, Category TEXT, Total TEXT, Date Date)",
          );
        });
    return database;
  }

  Future insertModel(Model model) async {
    await openDb();
    return await database.insert('model', model.toJson());
  }

  Future<List<Model>> getModelList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await database.query('model');

    return List.generate(maps.length, (i) {
      return Model(
          NumberofDiamond: maps[i]['NumberofDiamond'],
          Price: maps[i]['Price'],
          Category: maps[i]['Category'],
          Total: maps[i]['Total'],

      );


    });


  }
  Future<int> updateModel(Model model) async {
    await openDb();
    return await database.update('model', model.toJson(),
        where: "Numberofdiamond = ?", whereArgs: [model.NumberofDiamond],
    );
  }

  Future<void> deleteModel(Model model) async {
    await openDb();
    await database.delete('model', where: "Numberofdiamond = ?", whereArgs: [model.NumberofDiamond]);
  }

  // Future<int> updateModel(Model model) async {
  //   await openDb();
  //   return await _database.update('model', model.toJson(),
  //       where: "id = ?", whereArgs: [model.id]);
  // }
  //
  // Future<void> deleteModel(Model model) async {
  //   await openDb();
  //   await _database.delete('model', where: "id = ?", whereArgs: [model.id]);
  // }
}