import 'package:flutter/material.dart';
import 'package:minigame_app/screen/connexion.dart';
import 'package:minigame_app/screen/accueil.dart';
import 'package:minigame_app/screen/leaderboard.dart';
import 'package:minigame_app/screen/regles.dart';
import 'package:minigame_app/screen/Games/ReactionTime.dart';
import 'package:minigame_app/screen/Games/VisualMemory.dart';
import 'package:minigame_app/screen/Games/GuessTheNumber.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {

  /*Commenter cette partie pour lancer l'app sur Edge/Chrome*/
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'minigameDatabase3.db'),
    onCreate: (Database db, int version) async {
      print("create");
      await db.execute(
        '''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT UNIQUE NOT NULL
        );
        '''
      );

      await db.execute(
        '''
        CREATE TABLE scores(
          id_user INTEGER NOT NULL,
          id_game INTEGER NOT NULL,
          score FLOAT NOT NULL
        )
        '''
      );
    },
    version: 1,
  );
  /*Fin de la partie à commenter*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiniGame',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => LoginScreen());
        } else if (settings.name == '/accueil') {
          return MaterialPageRoute(builder: (_) => AccueilScreen());
        } else if (settings.name == '/leaderboard') {
          return MaterialPageRoute(builder: (_) => LeaderboardScreen());
        } else if (settings.name == '/regles') {
          return MaterialPageRoute(builder: (_) => ReglesScreen());
        } else if (settings.name == '/reactiontime') {
          return MaterialPageRoute(builder: (_) => const ReactionTimeScreen());
        } else if (settings.name == '/visualmemory') {
          return MaterialPageRoute(builder: (_) => const VisualMemoryScreen());
        } else if (settings.name == '/guessthenumber') {
          return MaterialPageRoute(builder: (_) => GuessTheNumber());
        }
        return null;
      },
    );
  }
}