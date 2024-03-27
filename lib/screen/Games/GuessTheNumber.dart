import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:minigame_app/screen/Navigation/BottomNavigationBarNone.dart';

class GuessTheNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess The Number',
      home: GuessPage(),
    );
  }
}

class GuessPage extends StatefulWidget {
  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  late int _targetNumber;
  late int _level;
  late TextEditingController _controller;
  late Timer _timer;
  int _seconds = 5;
  int _guessAttempts = 0;
  bool _showNumber = true;

  @override
  void initState() {
    super.initState();
    _level = 1;
    _targetNumber = _generateNumber();
    _controller = TextEditingController();
    _startTimer();
  }

  int _generateNumber() {
    // Augmenter le nombre de chiffres en fonction du niveau
    num maxNumber = pow(10, _level + 1) - 1;
    return Random().nextInt(maxNumber.toInt()) + 1;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        setState(() {
          _showNumber = false;
          _timer.cancel();
          // Afficher directement le champ de saisie
          _controller.clear();
        });
      }
    });
  }

  void _checkNumber() {
    int guess = int.tryParse(_controller.text) ?? -1;
    if (guess == _targetNumber) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Correct!'),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        _level++;
        _targetNumber = _generateNumber();
        _seconds = 5;
        _showNumber = true;
        _guessAttempts = 0;
        _startTimer();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect, try again!'),
          duration: Duration(seconds: 2),
        ),
      );
      _showRetryDialog();
    }
  }

  void _showRetryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tu as perdu !'),
          content: Text('Tu veux rejouer ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartGame();
              },
              child: Text('Oui'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Do something if the user chooses not to play again
              },
              child: Text('Non'),
            ),
          ],
        );
      },
    );
  }

  void _restartGame() {
    setState(() {
      _level = 1;
      _targetNumber = _generateNumber();
      _seconds = 5;
      _showNumber = true;
      _startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 253, 242), // Nouvelle couleur de fond
      appBar: AppBar(
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
            Navigator.pushNamed(context, '/accueil'); // Action pour revenir à la page précédente
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showNumber
                ? Text(
                    'Level $_level: $_targetNumber',
                    style: TextStyle(fontSize: 24),
                  )
                : Column(
                    children: [
                      Text(
                        'Enter your guess:',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            hintText: 'Entre ton chiffre ici',
                          ),
                          onSubmitted: (_) => _checkNumber(),
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: 20),
            _showNumber
                ? Text(
                    '$_seconds secondes restantes',
                    style: TextStyle(fontSize: 20),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarNone(),
    );
  }
}
