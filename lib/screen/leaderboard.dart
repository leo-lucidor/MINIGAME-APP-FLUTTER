import 'package:flutter/material.dart';
import 'package:minigame_app/screen/Navigation/BottomNavigationBarLeaderboard.dart';

class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Color.fromARGB(255, 244, 253, 242), // Nouvelle couleur d'arrière-plan de la page
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 253, 242), // Nouvelle couleur de la barre d'applications
        centerTitle: true,
        automaticallyImplyLeading: false, // Enlève la flèche de retour
        title: Image.asset(
          'images/logo.png', // Chemin vers votre image dans le dossier images
          width: 200, // Largeur souhaitée de l'image
          height: 200, // Hauteur souhaitée de l'image
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Votre contenu de leaderboard ici
              DataTable(
                columns: [
                  DataColumn(label: Text('Rank')),
                  DataColumn(label: Text('Player')),
                  DataColumn(label: Text('Score')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('John')),
                    DataCell(Text('500')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('Doe')),
                    DataCell(Text('400')),
                  ]),
                  // Ajoutez d'autres lignes de données pour chaque joueur
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarLeaderboard(),
    );
  }
}
