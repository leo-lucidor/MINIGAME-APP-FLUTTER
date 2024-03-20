import 'package:flutter/material.dart';

class BottomNavigationBarAcceuil extends StatelessWidget {
  BottomNavigationBarAcceuil();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.games, color: Color.fromARGB(255, 255, 78, 31)), // Changer la couleur de l'icône en vert
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
        if(index == 1) {
          Navigator.pushNamed(context, '/leaderboard');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/regles');
        }
      },
    );
  }
}