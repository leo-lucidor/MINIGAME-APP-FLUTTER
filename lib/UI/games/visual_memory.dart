import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class VisualMemory extends StatefulWidget {

  const VisualMemory({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  VisualMemoryState createState() => VisualMemoryState();
}

class VisualMemoryState extends State<VisualMemory> {
  late List<List<bool>> grid;
  int gridSize = 3;
  List<int> sequence = [];
  List<int> playerSequence = [];
  int currentLevel = 1;
  int numTilesToMatch = 3;
  bool gameOver = false;
  int livesRemaining = 3;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void reset() {
    gridSize = 3;
    currentLevel = 1;
    numTilesToMatch = 3;
    livesRemaining = 3;
  }

  void startGame() {
    setState(() {
      grid = List.generate(gridSize, (_) => List.filled(gridSize, false));
      sequence.clear();
      playerSequence.clear();
      gameOver = false;
    });

    Timer(Duration(seconds: 1), () {
      generateSequence();
    });
  }

  void generateSequence() {
    Random random = Random();
    sequence.clear();
    for (int i = 0; i < numTilesToMatch; i++) {
      int randIndex = random.nextInt(gridSize * gridSize);
      while (sequence.contains(randIndex)) {
        randIndex = random.nextInt(gridSize * gridSize);
      }
      sequence.add(randIndex);
    }
    illuminateSequence();
  }

  void illuminateSequence() {
    for (int index in sequence) {
      int row = index ~/ gridSize;
      int col = index % gridSize;
      Timer(Duration(milliseconds: 500), () {
        setState(() {
          grid[row][col] = true;
        });
      });
      Timer(Duration(milliseconds: 1500), () {
        setState(() {
          grid[row][col] = false;
        });
      });
    }
  }

  void checkPlayerSequence(int index) {
    if (!gameOver) {
      int row = index ~/ gridSize;
      int col = index % gridSize;
      if (!playerSequence.contains(index)) {
        setState(() {
          playerSequence.add(index);
          grid[row][col] = true;
        });
        if (sequence.contains(index)) {
          if (playerSequence.length == numTilesToMatch) {
            if (numTilesToMatch >= (gridSize * gridSize) ~/ 2) {
              gridSize++;
            }
            setState(() {
              currentLevel++;
              numTilesToMatch++;
              playerSequence.clear();
            });
            startGame();
          }
        } else if (!sequence.contains(index) && livesRemaining > 1) {
          if (playerSequence.length == numTilesToMatch) {
            setState(() {
              livesRemaining--;
              playerSequence.clear();
            });
            startGame();
          }
        } else {
          if (playerSequence.length == numTilesToMatch) {
            setState(() {
              gameOver = true;
            });
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Game over !"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        reset();
                        startGame();
                      },
                      child: Text("Restart"),
                    ),
                  ],
                );
              },
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Level: $currentLevel',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Lives remaining: $livesRemaining',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(32.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridSize,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: gridSize * gridSize,
                itemBuilder: (BuildContext context, int index) {
                  int row = index ~/ gridSize;
                  int col = index % gridSize;
                  return GestureDetector(
                    onTap: () => checkPlayerSequence(index),
                    child: Container(
                      color: grid[row][col] ? Colors.blue : Colors.grey,
                    ),
                  );
                },
              ),
              if (gameOver)
                ElevatedButton(
                  onPressed: () {
                    startGame();
                  },
                  child: Text('Restart'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
