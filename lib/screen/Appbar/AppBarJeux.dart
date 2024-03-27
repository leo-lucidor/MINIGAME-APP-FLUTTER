import 'package:flutter/material.dart';

class AppBarJeuxComponent extends StatelessWidget {
  AppBarJeuxComponent();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 244, 253, 242), // Nouvelle couleur de la barre d'applications
      centerTitle: true,
      title: Image.asset(
        'images/logo.png', // Chemin vers votre image dans le dossier images
        width: 200, // Largeur souhaitée de l'image
        height: 200, // Hauteur souhaitée de l'image
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back), // icône de flèche de retour
        onPressed: () {
          Navigator.of(context).pop(); // Action pour revenir à la page précédente
        },
      ),
    );
  }
}