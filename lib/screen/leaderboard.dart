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
              ExpansionTile(
                title: Text('Reaction Time'), // Titre du jeu
                children: <Widget>[
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Rang')),
                      DataColumn(label: Text('Joueur')),
                      DataColumn(label: Text('Temps de réaction (ms)')),
                    ],
                    rows: [
                      const DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('John')),
                        DataCell(Text('250')),
                      ]),
                      const DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Doe')),
                        DataCell(Text('300')),
                      ]),
                    ],
                  ),
                  // Ajouter d'autres règles pour le jeu 1 ici
                ],
              ),
              ExpansionTile(
                title: Text('Visual Memory'), // Titre du jeu
                children: <Widget>[
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Rang')),
                      DataColumn(label: Text('Joueur')),
                      DataColumn(label: Text('Niveau atteint')),
                    ],
                    rows: [
                      const DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('John')),
                        DataCell(Text('12')),
                      ]),
                      const DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Doe')),
                        DataCell(Text('8')),
                      ]),
                    ],
                  ),
                  // Ajouter d'autres règles pour le jeu 1 ici
                ],
              ),
              ExpansionTile(
                title: Text('Aim Trainer'), // Titre du jeu
                children: <Widget>[
                  DataTable(
                    columns: [
                      DataColumn(label: Text('rang')),
                      DataColumn(label: Text('Joueur')),
                      DataColumn(label: Text('Cibles touchées')),
                    ],
                    rows: [
                      const DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('John')),
                        DataCell(Text('30')),
                      ]),
                      const DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Doe')),
                        DataCell(Text('25')),
                      ]),
                    ],
                  ),
                  // Ajouter d'autres règles pour le jeu 1 ici
                ],
              ), 
              ExpansionTile(
                title: Text('TicTacToe'), // Titre du jeu
                children: <Widget>[
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Rang')),
                      DataColumn(label: Text('Joueur')),
                      DataColumn(label: Text('Nombre victoires')),
                    ],
                    rows: [
                      const DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('John')),
                        DataCell(Text('15')),
                      ]),
                      const DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Doe')),
                        DataCell(Text('5')),
                      ]),
                    ],
                  ),
                  // Ajouter d'autres règles pour le jeu 1 ici
                ],
              ), 
              ExpansionTile(
                title: Text('Guess the number'), // Titre du jeu
                children: <Widget>[
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Rang')),
                      DataColumn(label: Text('Joueur')),
                      DataColumn(label: Text('Niveau atteint')),
                    ],
                    rows: [
                      const DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('John')),
                        DataCell(Text('9')),
                      ]),
                      const DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Doe')),
                        DataCell(Text('5')),
                      ]),
                    ],
                  ),
                  // Ajouter d'autres règles pour le jeu 1 ici
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
