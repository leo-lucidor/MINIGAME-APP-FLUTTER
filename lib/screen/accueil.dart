import 'package:flutter/material.dart';
import 'package:minigame_app/screen/Navigation/BottomNavigationBarAccueil.dart';

class AccueilScreen extends StatelessWidget {
  final TextEditingController _rechercheController = TextEditingController();

  AccueilScreen();

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
              Text(
                'Choisissez un mini-jeu :',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/reactiontime');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 78, 31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bord arrondi
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Padding
                ),
                child: Text('Reaction Time',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10), // Ajout d'un espace de 10 pixels entre les boutons
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/visualmemory');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 78, 31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bord arrondi
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Padding
                ),
                child: Text('Visual Memory',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10), // Ajout d'un espace de 10 pixels entre les boutons
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/guessthenumber');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 78, 31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bord arrondi
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Padding
                ),
                child: Text('Guess The Number',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10), // Ajout d'un espace de 10 pixels entre les boutons
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarAcceuil(),
    );
  }
}
