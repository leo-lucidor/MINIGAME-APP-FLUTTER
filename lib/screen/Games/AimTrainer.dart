import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AimTrainerScreen extends StatefulWidget {
  const AimTrainerScreen({Key? key}) : super(key: key);

  @override
  _AimTrainerScreenState createState() => _AimTrainerScreenState();
}

class _AimTrainerScreenState extends State<AimTrainerScreen> {
  late DateTime _startTime;
  late DateTime _endTime;
  late Duration _totalDuration;
  int _targetCount = 0;
  late Offset _targetPosition;
  double _totalClickDuration = 0.0;

  @override
  void initState() {
    super.initState();
    _totalDuration = Duration.zero;
    _targetPosition = const Offset(0, 0); // Initialiser à une position hors de l'écran
    _startGame();
  }

  void _startGame() {
    _targetCount = 0;
    _totalClickDuration = 0.0;
    _nextTarget();
  }

  Offset _generateRandomPosition() {
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final targetSize = 50.0; // Taille de la cible
    final randomX = random.nextDouble() * (screenWidth - targetSize);
    final randomY = random.nextDouble() * (screenHeight - targetSize);
    return Offset(randomX, randomY);
  }

  void _nextTarget() {
    setState(() {
      _targetCount++;
      _targetPosition = _generateRandomPosition();
      _startTime = DateTime.now();
    });
  }

  void _onTargetClicked() {
    _endTime = DateTime.now();
    final clickDuration = _endTime.difference(_startTime).inMilliseconds / 1000;
    setState(() {
      _totalClickDuration += clickDuration;
      if (_targetCount < 10) {
        _nextTarget();
      } else {
        _endGame();
      }
    });
  }

  void _endGame() {
    setState(() {
      _totalDuration = DateTime.now().difference(_startTime);
    });
    // Calculate average click duration
    final averageClickDuration = _totalClickDuration / _targetCount;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Game Over'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total time: ${_totalDuration.inSeconds} seconds'),
            Text('Average click duration: ${averageClickDuration.toStringAsFixed(2)} seconds'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _startGame();
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aim Trainer'),
      ),
      body: GestureDetector(
        onTap: _onTargetClicked,
        child: Center(
          child: _targetCount < 10
              ? Stack(
                  children: [
                    Positioned(
                      left: _targetPosition.dx,
                      top: _targetPosition.dy,
                      child: Text(
                        'Target $_targetCount',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                )
              : Text(
                  'Game Over',
                  style: TextStyle(fontSize: 24),
                ),
        ),
      ),
    );
  }
}
