import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _version = 1;
  static const _dbName = "minigameDatabase3.db";

  
  static Future<Database> getDB() async {
    var factory = databaseFactory;
    return factory.openDatabase(join(await getDatabasesPath(), _dbName));
  }
}