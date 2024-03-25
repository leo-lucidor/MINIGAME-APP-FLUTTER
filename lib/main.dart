import 'package:flutter/material.dart';
import 'package:minigame_app/screen/connexion.dart';
import 'package:minigame_app/screen/accueil.dart';
import 'package:minigame_app/screen/leaderboard.dart';
import 'package:minigame_app/screen/regles.dart';
import 'package:minigame_app/screen/Games/ReactionTime.dart';
import 'package:minigame_app/screen/Games/VisualMemory.dart';
import 'package:minigame_app/screen/Games/AimTrainer.dart';
import 'package:minigame_app/screen/Games/TicTacToe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        } else if (settings.name == '/aimtrainer') {
          return MaterialPageRoute(builder: (_) => const AimTrainerScreen());
        } else if (settings.name == '/tictactoe'){
          return MaterialPageRoute(builder: (_) => TicTacToe());
        }
        return null;
      },
    );
  }
}