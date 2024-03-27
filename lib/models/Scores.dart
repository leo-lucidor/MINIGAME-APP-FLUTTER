import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';
import './DatabaseHelper.dart';

class ScoresTable {

  static Future<int> addScoreReactionTime(int idUser, double score) async {
    Database db = await DatabaseHelper.getDB();
    return await db.insert('scores', {'id_user': idUser, 'id_game': 1, 'score': score});
  }

  static Future<int> addScoreVisualMemory(int idUser, double score) async {
    Database db = await DatabaseHelper.getDB();
    return await db.insert('scores', {'id_user': idUser, 'id_game': 2, 'score': score});
  }

  static Future<int> addScoreAimTrainer(int idUser, double score) async {
    Database db = await DatabaseHelper.getDB();
    return await db.insert('scores', {'id_user': idUser, 'id_game': 3, 'score': score});
  }

  static Future<int> addScoreGuessTheNumber(int idUser, double score) async {
    Database db = await DatabaseHelper.getDB();
    return await db.insert('scores', {'id_user': idUser, 'id_game': 4, 'score': score});
  }

  static Future<List<Map<String, dynamic>>> getScores() async {
    Database db = await DatabaseHelper.getDB();
    return await db.query('scores');
  }

  static Future<double> getBestScoreReactionTime(int idUser) async {
    Database db = await DatabaseHelper.getDB();
    List<Map<String, dynamic>> bestScore = await db.query('scores', where: 'id_user = ? AND id_game = ?', whereArgs: [idUser, 1], orderBy: 'score', limit: 1);
    if (bestScore.isEmpty) {
      return 0;
    }
    return bestScore[0]['score'];
  }

  static Future<double> getBestScoreVisualMemory(int idUser) async {
    Database db = await DatabaseHelper.getDB();
    List<Map<String, dynamic>> bestScore = await db.query('scores', where: 'id_user = ? AND id_game = ?', whereArgs: [idUser, 2], orderBy: 'score DESC', limit: 1);
    if (bestScore.isEmpty) {
      return 0;
    }
    return bestScore[0]['score'];
  }

  static Future<double> getBestScoreAimTrainer(int idUser) async {
    Database db = await DatabaseHelper.getDB();
    List<Map<String, dynamic>> bestScore = await db.query('scores', where: 'id_user = ? AND id_game = ?', whereArgs: [idUser, 3], orderBy: 'score DESC', limit: 1);
    if (bestScore.isEmpty) {
      return 0;
    }
    return bestScore[0]['score'];
  }

  static Future<double> getBestScoreGuessTheNumber(int idUser) async {
    Database db = await DatabaseHelper.getDB();
    List<Map<String, dynamic>> bestScore = await db.query('scores', where: 'id_user = ? AND id_game = ?', whereArgs: [idUser, 4], orderBy: 'score DESC', limit: 1);
    if (bestScore.isEmpty) {
      return 0;
    }
    return bestScore[0]['score'];
  }

  static Future<List<Map<String, dynamic>>> getScoresReactionTime(int idUser) async {
    Database db = await DatabaseHelper.getDB();
    return await db.query('scores', where: 'id_user = ? AND id_game = ?', whereArgs: [idUser, 1]);
  }

  static Future<List<Map<String, dynamic>>> getScoresVisualMemory(int idUser) async {
    Database db = await DatabaseHelper.getDB();
    return await db.query('scores', where: 'id_user = ? AND id_game = ?', whereArgs: [idUser, 2]);
  }

  static Future<List<Map<String, dynamic>>> getScoresAimTrainer(int idUser) async {
    Database db = await DatabaseHelper.getDB();
    return await db.query('scores', where: 'id_user = ? AND id_game = ?', whereArgs: [idUser, 3]);
  }

  static Future<List<Map<String, dynamic>>> getScoresGuessTheNumber(int idUser) async {
    Database db = await DatabaseHelper.getDB();
    return await db.query('scores', where: 'id_user = ? AND id_game = ?', whereArgs: [idUser, 4]);
  }

  static Future<List<Map<String, dynamic>>> getClassementReactionTime() async {
    Database db = await DatabaseHelper.getDB();
    return await db.rawQuery('SELECT id_user, score FROM scores WHERE id_game = 1 ORDER BY score ASC');
  }

  static Future<List<Map<String, dynamic>>> getClassementVisualMemory() async {
    Database db = await DatabaseHelper.getDB();
    return await db.rawQuery('SELECT id_user, score FROM scores WHERE id_game = 2 ORDER BY score DESC');
  }

  static Future<List<Map<String, dynamic>>> getClassementAimTrainer() async {
    Database db = await DatabaseHelper.getDB();
    return await db.rawQuery('SELECT id_user, score FROM scores WHERE id_game = 3 ORDER BY score DESC');
  }

  static Future<List<Map<String, dynamic>>> getClassementGuessTheNumber() async {
    Database db = await DatabaseHelper.getDB();
    return await db.rawQuery('SELECT id_user, score FROM scores WHERE id_game = 4 ORDER BY score DESC');
  }
}