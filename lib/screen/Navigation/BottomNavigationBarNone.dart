import 'package:flutter/material.dart';

class BottomNavigationBarNone extends StatelessWidget {
  BottomNavigationBarNone();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.games), // Changer la couleur de l'icône en vert
          label: 'Jeux', // Changer la couleur de l'arrière-plan en vert
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
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
        } else if(index == 1) {
          Navigator.pushNamed(context, '/leaderboard');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/regles');
        }
      },
    );
  }
}