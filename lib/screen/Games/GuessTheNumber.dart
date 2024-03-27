import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:minigame_app/screen/Appbar/AppBarJeux.dart';
import 'package:minigame_app/screen/Navigation/BottomNavigationBarNone.dart';

void main() {
  runApp(GuessTheNumber());
}

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
  late int _lives;
  late TextEditingController _controller;
  late Timer _timer;
  int _seconds = 5;
  bool _showNumber = true;

  @override
  void initState() {
    super.initState();
    _level = 1;
    _lives = 3;
    _targetNumber = _generateNumber();
    _controller = TextEditingController();
    _startTimer();
  }

  int _generateNumber() {
    return Random().nextInt(_level * 10) + 1;
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
          _lives--;
          if (_lives > 0) {
            _showResult('Out of time! Try again.');
          } else {
            _showResult('Out of lives! You lose.');
          }
        });
      }
    });
  }

  void _checkNumber() {
    int guess = int.tryParse(_controller.text) ?? -1;
    if (guess == _targetNumber) {
      _showResult('Correct!');
    } else {
      _showResult('Incorrect, try again!');
    }
  }

  void _showResult(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        onVisible: () {
          setState(() {
            if (message == 'Correct!') {
              _level++;
              _targetNumber = _generateNumber();
              _seconds = 5;
              _showNumber = true;
            } else {
              _controller.clear();
            }
          });
          if (message != 'Correct!') {
            _startTimer();
          }
        },
      ),
    );
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
                : Text(
                    'Time\'s up! Enter your guess:',
                    style: TextStyle(fontSize: 24),
                  ),
            SizedBox(height: 20),
            _showNumber
                ? Text(
                    '$_seconds seconds left',
                    style: TextStyle(fontSize: 20),
                  )
                : SizedBox.shrink(),
            SizedBox(height: 20),
            _showNumber
                ? SizedBox.shrink()
                : SizedBox(
                    width: 150,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'Enter guess',
                      ),
                      onSubmitted: (_) => _checkNumber(),
                    ),
                  ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Icon(
                  index < _lives ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: _lives / 3,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarNone(),
    );
  }
}
