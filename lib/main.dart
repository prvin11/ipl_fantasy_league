import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/helper.dart';
import 'package:ipl_fantasy_league/models/player.dart';
import 'package:ipl_fantasy_league/models/team.dart';

void main() {
  runApp(LeaderBoardApp());
}

class LeaderBoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LeaderBoardScreen(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}

class LeaderBoardScreen extends StatelessWidget {
  final List<Map<String, String>> players = List.generate(
    5,
    (index) => {
      "rank": "0${index + 1}",
      "name": "Player Name",
      "matches": index == 2 ? "06" : "05",
      "kills": "20",
      "revives": "17",
      "totalPoints": index == 2 ? "08" : "09",
      "kda": "03",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Leaderboard'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: buildSNoColumn('S N0', [
                  Team('Ghosts', Icon(Icons.add), 90, [
                    Player(
                        name: 'Virat Kolhi',
                        image: Container(),
                        points: 30,
                        isOverseas: false)
                  ])
                ]),
              ),
              Expanded(
                child: buildTeamNameColumn('Team Name', [
                  Team('Ghosts', Icon(Icons.add), 90, [
                    Player(
                        name: 'Virat Kolhi',
                        image: Container(),
                        points: 30,
                        isOverseas: false)
                  ])
                ]),
              ),
              Expanded(
                child: buildTeamPointsColumn('Team Points', [
                  Team('Ghosts', Icon(Icons.add), 90, [
                    Player(
                        name: 'Virat Kolhi',
                        image: Container(),
                        points: 30,
                        isOverseas: false)
                  ])
                ]),
              ),
            ],
          ),
        ));
  }
}
