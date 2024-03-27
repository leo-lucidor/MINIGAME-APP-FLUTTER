import 'package:flutter/material.dart';
import 'package:minigame_app/screen/Appbar/AppBarJeux.dart';
import 'package:minigame_app/screen/Navigation/BottomNavigationBarNone.dart';

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Board(),
        ),
      ),
    );
  }
}

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  late List<List<String>> _board;
  late String _currentPlayer;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    _board = List.generate(3, (_) => List.generate(3, (_) => ''));
    _currentPlayer = 'X';
    _gameOver = false; // Réinitialiser _gameOver à false
  }

  void _markCell(int row, int col) {
    if (!_gameOver && _board[row][col] == '') {
      setState(() {
        _board[row][col] = _currentPlayer;
        if (_checkWin(row, col)) {
          _showDialog('Player $_currentPlayer wins!');
          _gameOver = true;
        } else if (_checkDraw()) {
          _showDialog('It\'s a draw!');
          _gameOver = true;
        } else {
          _currentPlayer = (_currentPlayer == 'X') ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWin(int row, int col) {
    // Check row
    if (_board[row][0] == _board[row][1] &&
        _board[row][1] == _board[row][2] &&
        _board[row][0] != '') {
      return true;
    }
    // Check column
    if (_board[0][col] == _board[1][col] &&
        _board[1][col] == _board[2][col] &&
        _board[0][col] != '') {
      return true;
    }
    // Check diagonal
    if ((row == col || row + col == 2) &&
        ((_board[0][0] == _board[1][1] && _board[1][1] == _board[2][2]) ||
            (_board[0][2] == _board[1][1] && _board[1][1] == _board[2][0])) &&
        _board[1][1] != '') {
      return true;
    }
    return false;
  }

  bool _checkDraw() {
    for (var row in _board) {
      for (var cell in row) {
        if (cell == '') {
          return false;
        }
      }
    }
    return true;
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _initializeBoard();
                });
              },
              child: Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 253, 242),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: _board.asMap().entries.map((entry) {
              int rowIndex = entry.key;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: entry.value.asMap().entries.map((cell) {
                  int colIndex = cell.key;
                  return GestureDetector(
                    onTap: () => _markCell(rowIndex, colIndex),
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          _board[rowIndex][colIndex],
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarNone(),
    );
  }
}
