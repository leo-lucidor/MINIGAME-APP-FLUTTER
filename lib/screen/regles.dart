import 'package:flutter/material.dart';
import 'package:minigame_app/screen/Navigation/BottomNavigationBarRegles.dart';

class ReglesScreen extends StatelessWidget {
  ReglesScreen();

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
            children: [
              ExpansionTile(
                title: Text('Reaction Time'), // Titre du jeu
                children: <Widget>[
                  ListTile(
                    title: Text('Réagis vite au signal visuel en appuyant sur l\'écran. Le joueur le plus rapide gagne.'),
                  ),
                  // Ajouter d'autres règles pour le jeu 1 ici
                ],
              ),
              ExpansionTile(
                title: Text('Visual Memory'), // Titre du jeu
                children: <Widget>[
                  ListTile(
                    title: Text('Exerce ta mémoire visuelle en mémorisant des motifs ou des arrangements. Reproduis-les avec précision pour gagner des points et avancer dans les niveaux.'),
                  ),
                  // Ajouter d'autres règles pour le jeu 2 ici
                ],
              ),
              ExpansionTile(
                title: Text('Aim Trainer'), // Titre du jeu
                children: <Widget>[
                  ListTile(
                    title: Text('Affine ta précision en visant et en tirant sur des cibles en mouvement. Marque des points en touchant les cibles le plus rapidement et précisément possible.'),
                  ),
                  // Ajouter d'autres règles pour le jeu 2 ici
                ],
              ),
              // Ajouter d'autres ExpansionTile pour chaque jeu
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarRegles(),
    );
  }
}
