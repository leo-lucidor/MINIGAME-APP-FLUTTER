import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class ReactionTime extends StatefulWidget {

  const ReactionTime({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ReactionTimeState createState() => ReactionTimeState();
}

class ReactionTimeState extends State<ReactionTime> {

  Color _currentColor = Colors.red;
  String _label = "Wait for green !";
  late DateTime _startTime;
  late DateTime _endTime;
  late Timer _timer;
  late Random _random;

  @override
  void initState() {
    super.initState();
    _random = Random();
    _startNextRound();
  }

  void _startNextRound() {
    setState(() {
      _currentColor = Colors.red;
      _label = "Wait for green !";
    });
    _timer = Timer(Duration(seconds: _random.nextInt(6) + 2), () {
      setState(() {
        _currentColor = Colors.green;
        _label = "Click !";
      });
      _startTime = DateTime.now();
    });
  }

  void _handleTap() {
    if (_currentColor == Colors.green) {
      setState(() {
        _endTime = DateTime.now();
        debugPrint(_endTime.toString());
      });
      final int reactionTime = _endTime.millisecondsSinceEpoch - _startTime.millisecondsSinceEpoch;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Your reaction time"),
            content: Text("Your reaction time is $reactionTime ms"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _startNextRound();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        _endTime = DateTime.now();
        _timer.cancel();
        debugPrint(_endTime.toString());
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Too early !"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _startNextRound();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: _handleTap,
        child: Container(
          color: _currentColor,
          child: Center(
            child: Text(
              _label,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}