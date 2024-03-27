import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';
import './DatabaseHelper.dart';

class UsersTable {
  static Future<int> addUser(String user) async {
    Database db = await DatabaseHelper.getDB();
    List<Map<String, dynamic>> userExist = await db.query('users', where: 'username = ?', whereArgs: [user]);
    if (userExist.isEmpty) {
      print("User doesn't exist");
      return await db.insert('users', {'username': user});
    } else {
      print("User already exists");
      return -1;
    }
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await DatabaseHelper.getDB();
    return await db.query('users');
  }

  static Future<int> getIdByName(String name) async {
    Database db = await DatabaseHelper.getDB();
    List<Map<String, dynamic>> user = await db.query('users', where: 'username = ?', whereArgs: [name]);
    return user[0]['id'];
  }

  static Future<String> getNameById(int id) async {
    Database db = await DatabaseHelper.getDB();
    List<Map<String, dynamic>> user = await db.query('users', where: 'id = ?', whereArgs: [id]);
    return user[0]['username'];
  }

  static String getName(int id) {
    String name = '';
    getNameById(id).then((value) {
      print(value);
      name = value;
    });
    return name;
  }
}