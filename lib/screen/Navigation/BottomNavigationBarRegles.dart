import 'package:flutter/material.dart';

class BottomNavigationBarRegles extends StatelessWidget {
  BottomNavigationBarRegles();

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
          icon: Icon(Icons.rule, color: Color.fromARGB(255, 255, 78, 31)),
          label: 'Règles',
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/accueil');
        } else if(index == 1) {
          Navigator.pushNamed(context, '/leaderboard');
        }
      },
    );
  }
}