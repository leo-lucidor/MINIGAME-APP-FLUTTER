import 'package:flutter/material.dart';

class BottomNavigationBarLeaderboard extends StatelessWidget {
  BottomNavigationBarLeaderboard();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.games), // Changer la couleur de l'icône en vert
          label: 'Jeux', // Changer la couleur de l'arrière-plan en vert
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard, color: Color.fromARGB(255, 255, 78, 31)),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.rule),
          label: 'Règles',
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/accueil');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/regles');
        }
      },
    );
  }
}