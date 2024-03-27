import 'package:flutter/material.dart';
import 'package:minigame_app/screen/Navigation/BottomNavigationBarLeaderboard.dart';
import 'package:minigame_app/models/Scores.dart';
import 'package:minigame_app/models/Users.dart';

class LeaderboardScreen extends StatefulWidget {
  LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<Map<String, dynamic>> leaderboardDataReactionTime = [];
  List<Map<String, dynamic>> leaderboardDataVisualMemory = [];
  List<Map<String, dynamic>> leaderboardDataGuessTheNumber = [];

  @override
  void initState() {
    super.initState();
    _fetchLeaderboardDataReactionTime();
    _fetchLeaderboardDataVisualMemory();
    _fetchLeaderboardDataGuessTheNumber();
  }

  Future<void> _fetchLeaderboardDataReactionTime() async {
    List<Map<String, dynamic>> fetchedData = await ScoresTable.getClassementReactionTime();

    setState(() {
      leaderboardDataReactionTime = fetchedData;
    });
  }

  Future<void> _fetchLeaderboardDataVisualMemory() async {
    List<Map<String, dynamic>> fetchedData = await ScoresTable.getClassementVisualMemory();

    setState(() {
      leaderboardDataVisualMemory = fetchedData;
    });
  }

  Future<void> _fetchLeaderboardDataGuessTheNumber() async {
    List<Map<String, dynamic>> fetchedData = await ScoresTable.getClassementGuessTheNumber();

    setState(() {
      leaderboardDataGuessTheNumber = fetchedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 253, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 253, 242),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'images/logo.png',
          width: 200,
          height: 200,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExpansionTile(
                  title: const Text('Reaction Time'),
                  children: <Widget>[
                    FutureBuilder<List<DataRow>>(
                      future: _buildLeaderboardRowsRT(),
                      builder: (BuildContext context, AsyncSnapshot<List<DataRow>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DataTable(
                            columns: const [
                              DataColumn(label: Text('Rang')),
                              DataColumn(label: Text('Joueur')),
                              DataColumn(label: Text('Temps de réaction (ms)')),
                            ],
                            rows: snapshot.data!,
                          );
                        }
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Visual Memory'),
                  children: <Widget>[
                    FutureBuilder<List<DataRow>>(
                      future: _buildLeaderboardRowsVM(),
                      builder: (BuildContext context, AsyncSnapshot<List<DataRow>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DataTable(
                            columns: const [
                              DataColumn(label: Text('Rang')),
                              DataColumn(label: Text('Joueur')),
                              DataColumn(label: Text('Level')),
                            ],
                            rows: snapshot.data!,
                          );
                        }
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Guess The Number'),
                  children: <Widget>[
                    FutureBuilder<List<DataRow>>(
                      future: _buildLeaderboardRowsGTN(),
                      builder: (BuildContext context, AsyncSnapshot<List<DataRow>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DataTable(
                            columns: const [
                              DataColumn(label: Text('Rang')),
                              DataColumn(label: Text('Joueur')),
                              DataColumn(label: Text('Level')),
                            ],
                            rows: snapshot.data!,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarLeaderboard(),
    );
  }

  Future<List<DataRow>> _buildLeaderboardRowsRT() async {
    List<DataRow> rows = [];
    for (int i = 0; i < leaderboardDataReactionTime.length; i++) {
      final entry = leaderboardDataReactionTime[i];
      final rank = i + 1;
      final playerNameFuture = UsersTable.getNameById(entry['id_user']);
      final playerName = await playerNameFuture;
      final reactionTime = entry['score'].toString();

      rows.add(DataRow(cells: [
        DataCell(Text(rank.toString())),
        DataCell(Text(playerName)),
        DataCell(Text(reactionTime)),
      ]));
    }
    return rows;
  }

  Future<List<DataRow>> _buildLeaderboardRowsVM() async {
    List<DataRow> rows = [];
    for (int i = 0; i < leaderboardDataVisualMemory.length; i++) {
      final entry = leaderboardDataVisualMemory[i];
      final rank = i + 1;
      final playerNameFuture = UsersTable.getNameById(entry['id_user']);
      final playerName = await playerNameFuture;
      final level = entry['score'].toInt().toString();

      rows.add(DataRow(cells: [
        DataCell(Text(rank.toString())),
        DataCell(Text(playerName)),
        DataCell(Text(level)),
      ]));
    }
    return rows;
  }

  Future<List<DataRow>> _buildLeaderboardRowsGTN() async {
    List<DataRow> rows = [];
    for (int i = 0; i < leaderboardDataGuessTheNumber.length; i++) {
      final entry = leaderboardDataGuessTheNumber[i];
      final rank = i + 1;
      final playerNameFuture = UsersTable.getNameById(entry['id_user']);
      final playerName = await playerNameFuture;
      final level = entry['score'].toInt().toString();

      rows.add(DataRow(cells: [
        DataCell(Text(rank.toString())),
        DataCell(Text(playerName)),
        DataCell(Text(level)),
      ]));
    }
    return rows;
  }
}
