import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minigame_app/screen/Appbar/AppBarJeux.dart';
import 'package:minigame_app/screen/Navigation/BottomNavigationBarNone.dart';

class AimTrainerScreen extends StatefulWidget {
  const AimTrainerScreen({Key? key}) : super(key: key);

  @override
  _AimTrainerScreenState createState() => _AimTrainerScreenState();
}

class _AimTrainerScreenState extends State<AimTrainerScreen> {
  int _targetClicked = 0;
  DateTime? _startTime;
  DateTime? _endTime;
  List<int> _reactionTimes = [];
  bool _isGameRunning = false;
  int _remainingTime = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startGame() {
    _isGameRunning = true;
    _startTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime--;
        if (_remainingTime <= 0) {
          _isGameRunning = false;
          _timer.cancel();
          _showResultDialog();
        }
      });
    });
  }

  void _showResultDialog() {
    int totalReactionTime = _reactionTimes.reduce((a, b) => a + b);
    double averageReactionTime = totalReactionTime / _reactionTimes.length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Targets clicked: $_targetClicked"),
              Text("Average time per target: ${averageReactionTime.toStringAsFixed(2)} ms"),
              Text("This test is best taken with a mouse or tablet screen. Trackpads are difficult to score well with."),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _targetClicked = 0;
                  _startTime = null;
                  _endTime = null;
                  _reactionTimes.clear();
                  _remainingTime = 30;
                });
                _startGame();
              },
              child: Text("Restart"),
            ),
          ],
        );
      },
    );
  }

  void _handleTap() {
    if (_isGameRunning) {
      setState(() {
        _targetClicked++;
      });
    }
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Remaining Time: $_remainingTime',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: _handleTap,
              child: Stack(
                children: List.generate(
                  30,
                      (index) {
                    final random = Random();
                    final double x = random.nextDouble() * MediaQuery.of(context).size.width;
                    final double y = random.nextDouble() * MediaQuery.of(context).size.height;
                    return Visibility(
                      visible: _isGameRunning,
                      child: Positioned(
                        left: x,
                        top: y,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _targetClicked++;
                            });
                          },
                          child: Icon(Icons.circle, size: 50, color: Colors.blue),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarNone(),
    );
  }
}
