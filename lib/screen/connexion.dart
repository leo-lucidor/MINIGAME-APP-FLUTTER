import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _NomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 78, 31),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            height: 200,
            alignment: Alignment.center,
            child: Image.asset(
              'images/logo.png',
              width: 200,
              height: 200,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _NomController,
                    decoration: InputDecoration(
                      hintText: 'Nom...',
                      filled: true,
                      fillColor: Color.fromARGB(255, 234, 237, 240), // Couleur de fond gris
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Bordure arrondie lorsqu'en focus
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 78, 31)), // Bordure verte lorsqu'en focus
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Bordure arrondie par défaut
                        borderSide: BorderSide(color: Colors.transparent), // Bordure transparente par défaut
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _NomController.clear();
                        },
                      ),
                    ),
                  ),                  
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_NomController.text.isNotEmpty) {
                        Navigator.pushNamed(context, '/accueil');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 78, 31),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bord arrondi
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Padding
                    ),
                    child: Text('Se connecter',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } 
}
